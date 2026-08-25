terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
    consul = {
      source  = "hashicorp/consul"
      version = "2.15.1"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.8.2"
    }
  }
  required_version = ">= 1.8"

  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    region                      = "ru-central1"
    bucket                      = "dpk-devops-sandbox-terraform"
    key                         = "devops-sandbox/dev/consul-config/terraform.tfstate"
    workspace_key_prefix        = ""
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}

provider "consul" {
  address        = format("consul01.%s.%s.%s:8500", local.env_name, local.project_name, replace(local.domain_postfix, "-", "."))
  datacenter     = var.consul_region
  insecure_https = true
  scheme         = "https"
  token          = local.project_consul_token
}

provider "vault" {
  address          = "https://pki.dpkapp.ru"
  token            = yamldecode(file("~/.terraform-creds-devops-sandbox.yml")).vault_token
  skip_tls_verify  = true
  skip_child_token = true
}
