# variable "secrets" {
#   type = list(object({
#     project     = string
#     name        = string
#     type        = string
#     environment = string
#     secret_values = string
#   }))
#   default = [
#       { project = "smart_credit", name = "database", type = "string", environment = "uat", secret_values = "smart-credit-uat" },
#       { project = "smart_credit", name = "username", type = "string", environment = "uat", secret_values = "smartcreditdb_uat" },
#       { project = "smart_credit", name = "password", type = "string", environment = "uat", secret_values = "xdLtcU%!xKPK%8FfsnBZCskmVWiYw37xi5t" },
#       { project = "smart_credit", name = "host", type = "string", environment = "uat", secret_values = "10.192.48.137" },
#       { project = "smart_credit", name = "port", type = "string", environment = "uat", secret_values = "5432" },


#       { project = "camunda", name = "database", type = "string", environment = "uat", secret_values = "camunda-uat" },
#       { project = "camunda", name = "username", type = "string", environment = "uat", secret_values = "camundadb_uat" },
#       { project = "camunda", name = "password", type = "string", environment = "uat", secret_values = "BbP#^^f4ToD%Ap2Gz586atZF6MHxD*QgS&Q" },
#       { project = "camunda", name = "host", type = "string", environment = "uat", secret_values = "10.192.48.137" },
#       { project = "camunda", name = "port", type = "string", environment = "uat", secret_values = "5432" },


#       { project = "workflow", name = "database", type = "string", environment = "uat", secret_values = "workflow-uat" },
#       { project = "workflow", name = "username", type = "string", environment = "uat", secret_values = "workflowdb_uat" },
#       { project = "workflow", name = "password", type = "string", environment = "uat", secret_values = "3PCmEbLfSAH@F*YoTHUvxHeKxhidj7#@M@4" },
#       { project = "workflow", name = "host", type = "string", environment = "uat", secret_values = "10.192.48.137" },
#       { project = "workflow", name = "port", type = "string", environment = "uat", secret_values = "5432" },


#       { project = "smart_credit", name = "database", type = "string", environment = "qa", secret_values = "smart-credit-qa"},
#       { project = "smart_credit", name = "username", type = "string", environment = "qa", secret_values = "smartcreditdb_qa" },
#       { project = "smart_credit", name = "password", type = "string", environment = "qa", secret_values = "$bDk@gHoY9&WSAyUpoiUj@QRH$R*tXa7%sD" },
#       { project = "smart_credit", name = "host", type = "string", environment = "qa", secret_values = "10.192.48.144" },
#       { project = "smart_credit", name = "port", type = "string", environment = "qa", secret_values = "5432" },


#       { project = "camunda", name = "database", type = "string", environment = "qa", secret_values = "camunda-qa" },
#       { project = "camunda", name = "username", type = "string", environment = "qa", secret_values = "camundadb_qa" },
#       { project = "camunda", name = "password", type = "string", environment = "qa", secret_values = "BbP#^^f4ToD%Ap2Gz586atZF6MHxD*QgS&Q" },
#       { project = "camunda", name = "host", type = "string", environment = "qa", secret_values = "10.192.48.144" },
#       { project = "camunda", name = "port", type = "string", environment = "qa", secret_values = "5432" },


#       { project = "workflow", name = "database", type = "string", environment = "qa", secret_values = "workflow-qa" },
#       { project = "workflow", name = "username", type = "string", environment = "qa", secret_values = "workflowdb_qa"},
#       { project = "workflow", name = "password", type = "string", environment = "qa", secret_values = "3PCmEbLfSAH@F*YoTHUvxHeKxhidj7#@M@4"},
#       { project = "workflow", name = "host", type = "string", environment = "qa", secret_values = "10.192.48.144" },
#       { project = "workflow", name = "port", type = "string", environment = "qa", secret_values = "5432" },
      
#     ]
# }

# locals {
#   secrets_map = {
#     for s in var.secrets : "${s.project}_secret_${s.name}_${s.environment}" => s
#   }
# }

# resource "google_secret_manager_secret" "secrets" {
#   for_each = local.secrets_map

#   labels = {
#     "environment"              = each.value.environment
#     "jenkins-credentials-type" = each.value.type
#     "project"                  = each.value.project
#   }

#   secret_id = each.key

#   replication {
#     automatic = true
#   }
# }

# resource "google_secret_manager_secret_version" "secrets" {
    
#   for_each = local.secrets_map  
#   secret = google_secret_manager_secret.secrets[each.key].id
#   secret_data = each.value.secret_values
# }


# data "google_secret_manager_secret_version" "secrets" {
#   for_each = local.secrets_map
#   secret = google_secret_manager_secret.secrets[each.key].id

# }
