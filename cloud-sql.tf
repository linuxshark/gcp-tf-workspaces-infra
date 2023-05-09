# variable "sql-instances" {
#   type = map(object({
#     region           = string
#     database_version = string
#   }))
#   default = {
#     sql-uat = { region = "us-east1", database_version = "POSTGRES_11" }
#   }
# }

# resource "google_sql_database_instance" "sql-instances" {
#   for_each         = var.sql-instances
#   name             = "${each.key}-${random_id.db_name_suffix.hex}"
#   region           = each.value.region
#   database_version = each.value.database_version
#   depends_on       = [google_service_networking_connection.sql-uat-connection]
#   settings {
#     tier      = "db-f1-micro"
#     disk_size = 10
#     ip_configuration {
#       ipv4_enabled    = false
#       private_network = module.vpc["uat"].network_self_link
#       allocated_ip_range = google_compute_global_address.cloud-sql-range.name
#     }
#   }
#   deletion_protection = "false"
# }

# resource "random_id" "db_name_suffix" {
#   byte_length = 4
# }

# variable "database" {
#   type = map(object({
#     project  = string
#     instance = string
#   }))
#   default = {
#     credits-sql-uat = {
#       instance = "value"
#       project = "credits-340817"
#     }
#   }
# }

# resource "google_sql_database" "db" {
#   for_each = var.database
#   project  = each.value.project
#   name     = each.key
#   instance = each.value.instance
# }


# variable "sqluser" {
#   type = map(object({
#     project  = string
#     name = string
#     instance = string
#     password = string

#   }))
#   default = {
#     cloud-sql-user-uat = {
#       project = "credits-340817"
#       name     = "applaudo"
#       instance =  "sql-instances"
#       password = "changeme"
#     }
#   }
# }

# resource "google_sql_user" "users" {
#   for_each = var.sqluser
#   project  = each.value.project
#   name     = each.value.name
#   instance = each.value.instance
#   password = each.value.password
# }
