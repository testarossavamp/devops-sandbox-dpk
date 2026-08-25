module "dpk_consul" {
  count         = var.include_consul-config_scenarios ? 1 : 0
  source        = "terralist-app01.internal.infra.dpkapp.ru/kamaz/consul-config/local"
  version       = "0.3.3"
  env_name      = local.env_name
  project_name  = local.project_name
}