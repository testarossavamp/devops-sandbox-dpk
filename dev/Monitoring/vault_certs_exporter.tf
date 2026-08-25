module "vault_certs_exporter" {
  source      = "git::git@gitlab.dpkapp.ru:cicd/terraform/terraform-modules/k8s-vault-certs-exporter.git?ref=DEVOPS-2607-add-certificate-exporter"
  # source                      = "../../../../terraform-modules/k8s-vault-certs-exporter"
  vault_addr                  = "https://consul01.dev.devops-sandbox.dpkapp.ru"
  vault_token                 = lookup(jsondecode(data.vault_kv_secret_v2.vault_project_token.data_json), "root_token")
  # vault_certs_exporter_config = tostring(file("values/vault-certs-exporter.yaml"))
  vault_certs_exporter_config = <<-EOT
log-level: debug
port: 9333
fetch_interval: 5s
refresh_interval: 5s
batch_size_percent: 1
request_limit: 20
request_limit_burst: 20
pki: []
kv: []
EOT
}
