terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.116.0"
    }
  }
  required_version = ">= 1.8"

  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    region                      = "ru-central1"
    bucket                      = "dpk-devops-sandbox-terraform"
    key                         = "devops-sandbox/dev/folder/terraform.tfstate"
    workspace_key_prefix        = ""
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}

provider "yandex" {
  cloud_id = var.cloud_id
  token    = yamldecode(file("~/.terraform-creds-devops-sandbox.yml")).yandex_token
}
