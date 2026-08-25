locals {
  init = data.terraform_remote_state.init_project.outputs

  k8s_cluster_subnet_ids = [[local.init.subnet_id_a]]

  k8s_multimaster_enabled = length(var.k8s_network_zones) >= 3 ? true : false
}
