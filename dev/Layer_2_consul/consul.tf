module "dpk_consul" {
  source                  = "terralist-app01.internal.infra.dpkapp.ru/kamaz/consul/local"
  version                 = "0.3.6"
  consul_dns_zone_id      = local.internal_dns_zones
  consul_image_id         = var.consul_image_id
  consul_nodes_count      = var.consul_nodes_count
  consul_nodes_zone       = var.consul_nodes_zone
  consul_node_subnet_id   = local.subnet_id_a
  env_name                = local.env_name
  project_name            = local.project_name
  consul_node_preemptible = var.consul_node_preemptible
}