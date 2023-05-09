project_id = "credits-340817"
region     = "us-east1"
zone       = "us-east1-c"

env = "uat"

k8s-cluster ={
  uat = {
    cluster_location = "us-east1"
      node_locations   = ["us-east1-b", "us-east1-c"] //, "us-east1-d"]
      nodes_per_zone   = 2
      machine          = "n1-custom-4-12288"
      network          = "uat-network"
      name             = "uat-cluster"
    }
}

subnetworks = {
  uat = {cidr_block = "10.192.58.128/26", region = "us-east1", cluster_pod_block = "10.193.96.0/20", cluster_svc_block = "10.192.58.0/25"}
}

network = "credits-uat-network"
network-sql = "credits-uat-network-sql"
master_ipv4_cidr_block = "10.192.58.192/28"

repository_id = "credits_repository"
repository_description = "Share files between Workflow and SmartCredit"
repository_format = "MAVEN"

secrets = [
   { project = "smart_credit", name = "database", type = "string", environment = "uat", secret_values = "smart-credit-uat" },
      { project = "smart_credit", name = "username", type = "string", environment = "uat", secret_values = "smartcreditdb_uat" },
      { project = "smart_credit", name = "password", type = "string", environment = "uat", secret_values = "undergo-marvelous-residency-emptiness-dazzler" },
      //{ project = "smart_credit", name = "host", type = "string", environment = "uat", secret_values = "10.192.48.137" },
      //{ project = "smart_credit", name = "port", type = "string", environment = "uat", secret_values = "5432" },


      { project = "camunda", name = "database", type = "string", environment = "uat", secret_values = "camunda-uat" },
      { project = "camunda", name = "username", type = "string", environment = "uat", secret_values = "camundadb_uat" },
      { project = "camunda", name = "password", type = "string", environment = "uat", secret_values = "outer-express-carport-rocket-frenzied" },

      //{ project = "camunda", name = "host", type = "string", environment = "uat", secret_values = "10.192.48.137" },
      //{ project = "camunda", name = "port", type = "string", environment = "uat", secret_values = "5432" },


      { project = "workflow", name = "database", type = "string", environment = "uat", secret_values = "workflow-uat" },
      { project = "workflow", name = "username", type = "string", environment = "uat", secret_values = "workflowdb_uat" },
      { project = "workflow", name = "password", type = "string", environment = "uat", secret_values = "aptly-wafer-pushiness-foothill-cupcake" },
      //{ project = "workflow", name = "host", type = "string", environment = "uat", secret_values = "10.192.48.137" },
      //{ project = "workflow", name = "port", type = "string", environment = "uat", secret_values = "5432" },
]

bucket-credits = {
   workflow-files-uat = { force_destroy = true, location = "us-east1", project = "credits-340817", name = "workflow-files-uat" },
   smartcredit-files-uat = { force_destroy = true, location = "us-east1", project = "credits-340817", name = "smartcredit-files-uat" }, 
}
# storagebuckets = [
#     { force_destroy = true, location = "us-east1", project = "credits-340817", name = "workflow-files-uat" },
#     { force_destroy = true, location = "us-east1", project = "credits-340817", name = "smartcredit-files-uat" },
#   ]

  storagebuckets-names = ["workflow-files-uat", "smartcredit-files-uat"]

cluster_router_name = "cluster-uat-router"
cluster_nat_gateway_name = "uat-cluster-nat-gateway"
cloud_sql_range_name = "cloud-sql-range"


# variable "storagebuckets" {
#   type = map(object({
#     project       = string
#     location      = string
#     force_destroy = bool
#     name = string
#   }))
#   default = {
#     bucket-credits = {
#     project       = "credits-340817"
#     location      ="us-east1"
#     force_destroy = true
#     name = ""
#     }
#   }
# }

# variable "subnetworks" {
#   type = map(object({
#     cidr_block        = string
#     region            = string
#     cluster_pod_block = string
#     cluster_svc_block = string
#   }))
#   default = {
#     uat = {
#       cidr_block        = "10.192.58.128/26",
#       region            = "us-east1",
#       cluster_pod_block = "10.193.96.0/20",
#       cluster_svc_block = "10.192.58.0/25"
#     }
#   }
# }

# variable "subnetworks-sql" {
#   type = map(object({
#     cidr_block        = string
#     region            = string
#   }))
#   default = {
#     uat-sql = {
#       cidr_block        = "190.62.8.234/26",
#       region            = "us-east1",
#     }
#   }
# }

# variable "subnetworks" {
#   type = map(object({
#     cidr_block        = string
#     region            = string
#     cluster_pod_block = string
#     cluster_svc_block = string
#   }))
#   default = {
#     uat = {
#       cidr_block        = "10.192.58.128/26",
#       region            = "us-east1",
#       cluster_pod_block = "10.193.96.0/20",
#       cluster_svc_block = "10.192.58.0/25"
#     }
#   }
# }
