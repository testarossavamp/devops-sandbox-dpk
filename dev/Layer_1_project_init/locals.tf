locals {
  folder_id              = data.terraform_remote_state.init_project.outputs.folder_id
  network_id             = data.terraform_remote_state.init_project.outputs.network.id
  dns_external_address   = data.terraform_remote_state.init_project.outputs.network_addresses.project_k8s_external_dns_address
  internal_dns_zones     = data.terraform_remote_state.init_project.outputs.dns[0].id
  subnet_id_a            = [
    for item in data.terraform_remote_state.init_project.outputs.subnets : item.id if item.zone == "ru-central1-a"
  ][0]
}
