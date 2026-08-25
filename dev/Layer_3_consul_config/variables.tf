variable "helm_repo" {}
variable "nexus_registry" {}

############## Consul config ########
variable "include_consul-config_scenarios" {
  default = false
}
variable "consul_region" {}
variable "vault_consul_tokens_mount" {
  default = "consul_tokens"
}