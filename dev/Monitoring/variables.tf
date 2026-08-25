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
