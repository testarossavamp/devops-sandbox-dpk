module "dpk_k8s_cluster_config" {
  source                               = "terralist-app01.internal.infra.dpkapp.ru/kamaz/k8s-config/local"
  version                              = "1.0.0"
  folder_id                            = local.init.folder_id
  project_name                         = local.init.project_name
  env_name                             = local.init.env_name
  domain_name                          = replace(local.init.domain_postfix, "-", ".")
  dns_external_address                 = local.init.dns_external_address
  dns_provider                         = var.dns_provider
  dns_folder_id                        = var.dns_folder_id
  helm_repo                            = var.helm_repo
  nexus_registry                       = var.nexus_registry
  cert_manager_version                 = var.cert_manager_version
  external_dns_image_version           = var.external_dns_image_version
  external_dns_version                 = var.external_dns_version
  public_subnet_id                     = local.init.subnet_id_a
  haproxy_ingress_external_enabled     = var.enable_external_ingress
  haproxy_internal_cr_defaults_content = tostring(file("values/cr_defaults.yaml"))
  # haproxy_internal_cr_defaults_content = <<-EOT
  #   connect_timeout: 1800
  # EOT
  # haproxy_internal_cr_global_content   = tostring(file("values/cr_global.yaml"))
  haproxy_internal_cr_global_content   = <<-EOF
    tune_buffer_options:
        bufsize: 131072
  EOF
}
