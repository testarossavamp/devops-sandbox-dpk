helm_repo      = "https://repo.dpkapp.ru/repository/nexus-infra-helm"
nexus_registry = "repo.dpkapp.ru:5000/infra"

######### Consul Config #########
include_consul-config_scenarios = true
consul_region                   = "devops-sandbox-dev-dc"