terraform {
  required_version = ">= 1.8"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.116.0"
    }
    command = {
      source = "hkak03key/command"
      version = "0.1.1"
    }
  }
  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    region                      = "ru-central1"
    bucket                      = "dpk-devops-sandbox-terraform"
    key                         = "devops-sandbox/dev/k8s/terraform.tfstate"
    workspace_key_prefix        = ""
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}

provider "yandex" {
  token     = data.command.yc_iam_token.stdout
  cloud_id  = local.init.cloud_id
  folder_id = local.init.folder_id
}
