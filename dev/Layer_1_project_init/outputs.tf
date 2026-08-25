output "cloud_id" {
  value = var.cloud_id
}

output "folder_id" {
  value = local.folder_id
}

output "project_name" {
  value = var.project_name
}

output "env_name" {
  value = var.env_name
}

output "domain_postfix" {
  value = var.domain_postfix
}

output "network_id" {
  value = local.network_id
}

output "internal_dns_zones" {
  value = local.internal_dns_zones
}

output "subnet_id_a" {
  value = local.subnet_id_a
}

# костылёк для модуля впн, т.к. исторически он ждёт список мап
output "networks" {
  value = [data.terraform_remote_state.init_project.outputs.network]
}

# костылёк для модуля впн, т.к. исторически он ждёт мапу
# и для кубера тоже
output "network_subnet_ids" {
  value = data.terraform_remote_state.init_project.outputs.subnets
}

output "dns_external_address" {
  value = local.dns_external_address
}

output "network_addresses" {
  value = data.terraform_remote_state.init_project.outputs.network_addresses
}
