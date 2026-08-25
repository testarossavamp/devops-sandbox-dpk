locals {
  cloud_id               = data.terraform_remote_state.init_project.outputs.cloud_id
  folder_id              = data.terraform_remote_state.init_project.outputs.folder_id
  project_name           = data.terraform_remote_state.init_project.outputs.project_name
  env_name               = data.terraform_remote_state.init_project.outputs.env_name
  ######## Network #########
  domain_postfix         = data.terraform_remote_state.init_project.outputs.domain_postfix
  project_consul_token   = data.vault_kv_secret_v2.consul_project_token.data.token
}