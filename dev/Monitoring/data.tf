data "terraform_remote_state" "init_project" {
  backend = "s3"
  config = {
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

data "command" "yc_iam_token" {
  command = ["yc", "iam", "create-token"]
}

data "vault_kv_secret_v2" "vault_project_token" {
  mount      = "project_secrets"
  # ЭТО ДЛЯ ТЕСТА!!!
  # наиболее правильный способ - отдельная полися + токен
  name       = "${local.init.project_name}/${local.init.env_name}/vault/_self/initial_management"
}
