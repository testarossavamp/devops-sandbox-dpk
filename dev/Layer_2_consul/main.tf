terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.25.0"
    }
  }
  required_version = ">= 1.8"

  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    region                      = "ru-central1"
    bucket                      = "dpk-devops-sandbox-terraform"
    key                         = "devops-sandbox/dev/consul/terraform.tfstate"
    workspace_key_prefix        = ""
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}

provider "yandex" {
  token     = yamldecode(file("~/.terraform-creds-devops-sandbox.yml")).yandex_token
  cloud_id  = local.cloud_id
  folder_id = local.folder_id
}

provider "vault" {
  address          = "https://pki.dpkapp.ru"
  skip_child_token = true
  token            = yamldecode(file("~/.terraform-creds-devops-sandbox.yml")).vault_token
}
