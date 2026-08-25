locals {
  cloud_id           = data.terraform_remote_state.init_project.outputs.cloud_id
  domain_postfix     = data.terraform_remote_state.init_project.outputs.domain_postfix
  env_name           = data.terraform_remote_state.init_project.outputs.env_name
  folder_id          = data.terraform_remote_state.init_project.outputs.folder_id
  internal_dns_zones = data.terraform_remote_state.init_project.outputs.internal_dns_zones
  network_id         = data.terraform_remote_state.init_project.outputs.network_id
  project_name       = data.terraform_remote_state.init_project.outputs.project_name
  subnet_id_a        = data.terraform_remote_state.init_project.outputs.subnet_id_a
}