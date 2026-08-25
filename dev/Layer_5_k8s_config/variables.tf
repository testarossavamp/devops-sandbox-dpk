variable "dns_folder_id" {
  type    = string
  default = "b1g61u2f2ajbqv7jjfrn" # internal-infra
}
variable "helm_repo" {
  type    = string
  default = "https://repo.dpkapp.ru/repository/nexus-infra-helm"
}
variable "nexus_registry" {
  type    = string
  default = "repo.dpkapp.ru/infra"
}

######## K8S config
variable "cert_manager_version" {}
variable "dns_provider" {}
variable "external_dns_image_version" {}
variable "external_dns_version" {}
variable "ingress_image_digest" {}
variable "ingress_image_version" {}
variable "ingress_version" {}
variable "enable_external_ingress" {
  default = false
}
