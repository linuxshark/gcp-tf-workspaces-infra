project_id = "credits-340817"
region     = "us-east1"
zone       = "us-east1-c"

k8s-cluster ={
  prod = {
      cluster_location = "us-east1"
      node_locations   = ["us-east1-b", "us-east1-c"] //, "us-east1-d"]
      nodes_per_zone   = 2
      machine          = "n1-custom-4-12288"
      network          = "prod-network"
      name             = "prod-cluster"
    }
      # cluster_location = "us-east1"
      # node_locations   = ["us-east1-b", "us-east1-c"] //, "us-east1-d"]
      # nodes_per_zone   = 2
      # machine          = "n1-custom-4-12288"
      # network          = "prod-network"
      # name             = "prod-cluster"
    }

env = "prod"

subnetworks = {
  prod = {cidr_block = "10.192.66.128/26", region = "us-east1", cluster_pod_block = "10.193.160.0/20", cluster_svc_block = "10.192.66.0/25"}
}

secrets = [
  #  { project = "smart_credit", name = "database", type = "string", environment = "uat", secret_values = "smart-credit-uat" },
  #     { project = "smart_credit", name = "username", type = "string", environment = "uat", secret_values = "smartcreditdb_uat" },
  #     { project = "smart_credit", name = "password", type = "string", environment = "uat", secret_values = "undergo-marvelous-residency-emptiness-dazzler" },
  #     //{ project = "smart_credit", name = "host", type = "string", environment = "uat", secret_values = "10.192.48.137" },
  #     //{ project = "smart_credit", name = "port", type = "string", environment = "uat", secret_values = "5432" },


  #     { project = "camunda", name = "database", type = "string", environment = "uat", secret_values = "camunda-uat" },
  #     { project = "camunda", name = "username", type = "string", environment = "uat", secret_values = "camundadb_uat" },
  #     { project = "camunda", name = "password", type = "string", environment = "uat", secret_values = "outer-express-carport-rocket-frenzied" },

  #     //{ project = "camunda", name = "host", type = "string", environment = "uat", secret_values = "10.192.48.137" },
  #     //{ project = "camunda", name = "port", type = "string", environment = "uat", secret_values = "5432" },


  #     { project = "workflow", name = "database", type = "string", environment = "uat", secret_values = "workflow-uat" },
  #     { project = "workflow", name = "username", type = "string", environment = "uat", secret_values = "workflowdb_uat" },
  #     { project = "workflow", name = "password", type = "string", environment = "uat", secret_values = "aptly-wafer-pushiness-foothill-cupcake" },
  #     //{ project = "workflow", name = "host", type = "string", environment = "uat", secret_values = "10.192.48.137" },
  #     //{ project = "workflow", name = "port", type = "string", environment = "uat", secret_values = "5432" },
]

# storagebuckets = [
#     # { force_destroy = true, location = "us-east1", project = "credits-340817", name = "workflow-files-uat" },
#     # { force_destroy = true, location = "us-east1", project = "credits-340817", name = "smartcredit-files-uat" },
#   ]

  bucket-credits = {
  #  workflow-files-uat = { force_destroy = true, location = "us-east1", project = "credits-340817", name = "workflow-files-uat" },
  #  smartcredit-files-uat = { force_destroy = true, location = "us-east1", project = "credits-340817", name = "smartcredit-files-uat" }, 
}
# storagebuckets = [
#     { force_destroy = true, location = "us-east1", project = "credits-340817", name = "workflow-files-uat" },
#     { force_destroy = true, location = "us-east1", project = "credits-340817", name = "smartcredit-files-uat" },
#   ]

  storagebuckets-names = ["workflow-files-uat", "smartcredit-files-uat"]

cluster_router_name = "cluster-prod-router"
cluster_nat_gateway_name = "prod-cluster-nat-gateway"
cloud_sql_range_name = "cloud-sql-range"
# subnetworks = {
#       cidr_block        = "10.192.66.128/26"
#       region            = "us-east1"
#       cluster_pod_block = "10.193.160.0/20"
#       cluster_svc_block = "10.192.66.0/25"
# }

  network = "credits-prod-network"
  network-sql = "credits-prod-network-sql"
  master_ipv4_cidr_block = "10.192.66.192/28"

  repository_id = "credits_repository"
  repository_description = "Share files between Workflow and SmartCredit"
  repository_format = "MAVEN"
