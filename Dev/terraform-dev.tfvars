project_id = "credits-340817"
region     = "us-east1"
zone       = "us-east1-c"

env = "devqa"

k8s-cluster = {
  devqa = {
      cluster_location = "us-east1"
      node_locations   = ["us-east1-b", "us-east1-c"] //, "us-east1-d"]
      nodes_per_zone   = 2
      machine          = "n1-custom-4-7680"
      network          = "devqa-network"
      name             = "devqa-cluster"
    }
}

subnetworks = {
  devqa = {cidr_block = "10.192.50.128/26", region = "us-east1", cluster_pod_block = "10.193.32.0/20", cluster_svc_block = "10.192.50.0/25"}
}


# subnetworks = {
#       cidr_block        = "10.192.50.128/26"
#       region            = "us-east1"
#       cluster_pod_block = "10.193.32.0/20"
#       cluster_svc_block = "10.192.50.0/25"
# }

  network = "credits-network"
  network-sql = "credits-network-sql"
  master_ipv4_cidr_block = "10.192.50.192/28"

  repository_id = "credits-repository"
  repository_description = "Share files between Workflow and SmartCredit"
  repository_format = "MAVEN"

secrets = [
      # { project = "smart_credit", name = "database", type = "string", environment = "uat", secret_values = "smart-credit-uat" },
      # { project = "smart_credit", name = "username", type = "string", environment = "uat", secret_values = "smartcreditdb_uat" },
      # { project = "smart_credit", name = "password", type = "string", environment = "uat", secret_values = "undergo-marvelous-residency-emptiness-dazzler" },
      # { project = "smart_credit", name = "host", type = "string", environment = "uat", secret_values = "10.192.48.137" },
      # { project = "smart_credit", name = "port", type = "string", environment = "uat", secret_values = "5432" },


      # { project = "camunda", name = "database", type = "string", environment = "uat", secret_values = "camunda-uat" },
      # { project = "camunda", name = "username", type = "string", environment = "uat", secret_values = "camundadb_uat" },
      # { project = "camunda", name = "password", type = "string", environment = "uat", secret_values = "outer-express-carport-rocket-frenzied" },

      //{ project = "camunda", name = "host", type = "string", environment = "uat", secret_values = "10.192.48.137" },
      //{ project = "camunda", name = "port", type = "string", environment = "uat", secret_values = "5432" },


      # { project = "workflow", name = "database", type = "string", environment = "uat", secret_values = "workflow-uat" },
      # { project = "workflow", name = "username", type = "string", environment = "uat", secret_values = "workflowdb_uat" },
      # { project = "workflow", name = "password", type = "string", environment = "uat", secret_values = "aptly-wafer-pushiness-foothill-cupcake" },
      //{ project = "workflow", name = "host", type = "string", environment = "uat", secret_values = "10.192.48.137" },
      //{ project = "workflow", name = "port", type = "string", environment = "uat", secret_values = "5432" },


      { project = "smart_credit", name = "database", type = "string", environment = "dev", secret_values = "smart-credit-dev" },
      { project = "smart_credit", name = "username", type = "string", environment = "dev", secret_values = "smartcreditdb_dev" },
      { project = "smart_credit", name = "password", type = "string", environment = "dev", secret_values = "xdLtcU%!xKPK%8FfsnBZCskmVWiYw37xi5t" },
      { project = "smart_credit", name = "host", type = "string", environment = "dev", secret_values = "10.192.48.137" },
      { project = "smart_credit", name = "port", type = "string", environment = "dev", secret_values = "5432" },


      { project = "camunda", name = "database", type = "string", environment = "dev", secret_values = "camunda-dev" },
      { project = "camunda", name = "username", type = "string", environment = "dev", secret_values = "camundadb_dev" },
      { project = "camunda", name = "password", type = "string", environment = "dev", secret_values = "BbP#^^f4ToD%Ap2Gz586atZF6MHxD*QgS&Q" },
      { project = "camunda", name = "host", type = "string", environment = "dev", secret_values = "10.192.48.137" },
      { project = "camunda", name = "port", type = "string", environment = "dev", secret_values = "5432" },


      { project = "workflow", name = "database", type = "string", environment = "dev", secret_values = "workflow-dev" },
      { project = "workflow", name = "username", type = "string", environment = "dev", secret_values = "workflowdb_dev" },
      { project = "workflow", name = "password", type = "string", environment = "dev", secret_values = "3PCmEbLfSAH@F*YoTHUvxHeKxhidj7#@M@4" },
      { project = "workflow", name = "host", type = "string", environment = "dev", secret_values = "10.192.48.137" },
      { project = "workflow", name = "port", type = "string", environment = "dev", secret_values = "5432" },


      { project = "smart_credit", name = "database", type = "string", environment = "qa", secret_values = "smart-credit-qa"},
      { project = "smart_credit", name = "username", type = "string", environment = "qa", secret_values = "smartcreditdb_qa" },
      { project = "smart_credit", name = "password", type = "string", environment = "qa", secret_values = "$bDk@gHoY9&WSAyUpoiUj@QRH$R*tXa7%sD" },
      { project = "smart_credit", name = "host", type = "string", environment = "qa", secret_values = "10.192.48.144" },
      { project = "smart_credit", name = "port", type = "string", environment = "qa", secret_values = "5432" },

      { project = "smart_credit", name = "database", type = "string", environment = "qa-e2e", secret_values = "smart-credit-qa"},
      { project = "smart_credit", name = "username", type = "string", environment = "qa-e2e", secret_values = "smartcreditdb_qa" },
      { project = "smart_credit", name = "password", type = "string", environment = "qa-e2e", secret_values = "$bDk@gHoY9&WSAyUpoiUj@QRH$R*tXa7%sD" },
      { project = "smart_credit", name = "host", type = "string", environment = "qa-e2e", secret_values = "10.192.48.145" },
      { project = "smart_credit", name = "port", type = "string", environment = "qa-e2e", secret_values = "5432" },



      { project = "camunda", name = "database", type = "string", environment = "qa", secret_values = "camunda-qa" },
      { project = "camunda", name = "username", type = "string", environment = "qa", secret_values = "camundadb_qa" },
      { project = "camunda", name = "password", type = "string", environment = "qa", secret_values = "BbP#^^f4ToD%Ap2Gz586atZF6MHxD*QgS&Q" },
      { project = "camunda", name = "host", type = "string", environment = "qa", secret_values = "10.192.48.144" },
      { project = "camunda", name = "port", type = "string", environment = "qa", secret_values = "5432" },


      { project = "camunda", name = "database", type = "string", environment = "qa-e2e", secret_values = "camunda-qa" },
      { project = "camunda", name = "username", type = "string", environment = "qa-e2e", secret_values = "camundadb_qa" },
      { project = "camunda", name = "password", type = "string", environment = "qa-e2e", secret_values = "BbP#^^f4ToD%Ap2Gz586atZF6MHxD*QgS&Q" },
      { project = "camunda", name = "host", type = "string", environment = "qa-e2e", secret_values = "10.192.48.145" },
      { project = "camunda", name = "port", type = "string", environment = "qa-e2e", secret_values = "5432" },

      { project = "workflow", name = "database", type = "string", environment = "qa", secret_values = "workflow-qa" },
      { project = "workflow", name = "username", type = "string", environment = "qa", secret_values = "workflowdb_qa"},
      { project = "workflow", name = "password", type = "string", environment = "qa", secret_values = "3PCmEbLfSAH@F*YoTHUvxHeKxhidj7#@M@4"},
      { project = "workflow", name = "host", type = "string", environment = "qa", secret_values = "10.192.48.144" },
      { project = "workflow", name = "port", type = "string", environment = "qa", secret_values = "5432" },

      { project = "workflow", name = "database", type = "string", environment = "qa-e2e", secret_values = "workflow-qa" },
      { project = "workflow", name = "username", type = "string", environment = "qa-e2e", secret_values = "workflowdb_qa"},
      { project = "workflow", name = "password", type = "string", environment = "qa-e2e", secret_values = "3PCmEbLfSAH@F*YoTHUvxHeKxhidj7#@M@4"},
      { project = "workflow", name = "host", type = "string", environment = "qa-e2e", secret_values = "10.192.48.145" },
      { project = "workflow", name = "port", type = "string", environment = "qa-e2e", secret_values = "5432" },

      { project = "cms", name = "database", type = "string", environment = "qa-e2e", secret_values = "emma-cms" },
      { project = "cms", name = "username", type = "string", environment = "qa-e2e", secret_values = "emma-cms"},
      { project = "cms", name = "password", type = "string", environment = "qa-e2e", secret_values = "Uxq9R&vf"},
      { project = "cms", name = "host", type = "string", environment = "qa-e2e", secret_values = "10.192.48.145" },
      { project = "cms", name = "port", type = "string", environment = "qa-e2e", secret_values = "5432" },
]

bucket-credits = {
   smartcredit-files-dev = { force_destroy = true, location = "us-east1", project = "credits-340817", name = "smartcredit-files-dev" },
   smartcredit-files-qa = { force_destroy = true, location = "us-east1", project = "credits-340817", name = "smartcredit-files-qa" },
   workflow-files-dev = { force_destroy = true, location = "us-east1", project = "credits-340817", name = "workflow-files-dev" },
   workflow-files-qa =  { force_destroy = true, location = "us-east1", project = "credits-340817", name = "workflow-files-qa" },
 
}

# storagebuckets = [
#     { force_destroy = true, location = "us-east1", project = "credits-340817", name = "smartcredit-files-dev" },
#     { force_destroy = true, location = "us-east1", project = "credits-340817", name = "smartcredit-files-qa" },
#     { force_destroy = true, location = "us-east1", project = "credits-340817", name = "workflow-files-dev" },
#     { force_destroy = true, location = "us-east1", project = "credits-340817", name = "workflow-files-qa" },
#   ]

storagebuckets-names = ["smartcredit-files-dev", "smartcredit-files-qa", "workflow-files-dev", "workflow-files-qa"]

cluster_router_name = "cluster-router"
cluster_nat_gateway_name = "devqa-cluster-nat-gateway"
cloud_sql_range_name = "cloud-sql-range"

# variable "subnetworks" {
#   type = map(object({
#     cidr_block        = string
#     region            = string
#     cluster_pod_block = string
#     cluster_svc_block = string
#   }))
#   default = {
#     uat = {
#       cidr_block        = "10.192.66.128/26",
#       region            = "us-east1",
#       cluster_pod_block = "10.193.160.0/20",
#       cluster_svc_block = "10.192.66.0/25"
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
# }
