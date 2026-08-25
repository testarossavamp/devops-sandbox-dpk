locals {
  init = data.terraform_remote_state.init_project.outputs

  k8s_cluster_context_path = format("yc-%s-%s-k8s-cluster", local.init.env_name, local.init.project_name)
}
