data "terraform_remote_state" "init_project" {
  backend = "s3"
  config  = {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    region                      = "ru-central1"
    bucket                      = "dpk-devops-sandbox-terraform"
    key                         = "devops-sandbox/dev/folder/terraform.tfstate"
    workspace_key_prefix        = ""
    skip_credentials_validation = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}

data "vault_kv_secret_v2" "consul_project_token" {
  mount      = "project_secrets"
  name       = "${local.project_name}/${local.env_name}/consul/_self/initial_management"
}
