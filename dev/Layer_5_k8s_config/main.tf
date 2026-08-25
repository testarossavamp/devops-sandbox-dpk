terraform {
  required_version = ">= 1.8"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.116.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.25.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.17.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.35.1"
    }
    external = {
      source  = "hashicorp/external"
      version = ">= 2.3.3"
    }
    command = {
      source  = "hkak03key/command"
      version = "0.1.1"
    }
  }
  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    region                      = "ru-central1"
    bucket                      = "dpk-devops-sandbox-terraform"
    key                         = "devops-sandbox/dev/k8s-config/terraform.tfstate"
    workspace_key_prefix        = ""
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}

provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = local.k8s_cluster_context_path
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = local.k8s_cluster_context_path
}

provider "vault" {
  address          = yamldecode(file("~/.terraform-creds.yml")).vault_addr
  token            = yamldecode(file("~/.terraform-creds.yml")).vault_token
  skip_child_token = true
}

provider "yandex" {
  token     = data.command.yc_iam_token.stdout
  cloud_id  = local.init.cloud_id
  folder_id = local.init.folder_id
}
