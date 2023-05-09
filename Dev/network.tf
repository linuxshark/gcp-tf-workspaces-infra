# locals {
#   network-name = "credits-uat-network"
#   network-name-sql = "credits-uat-network-sql"
# }

# module "vpc" {
#   source  = "terraform-google-modules/network/google"
#   version = ">= 4.0.1, < 5.0.0"

#   project_id   = var.project_id
#   network_name = local.network-name
#   routing_mode = "GLOBAL"

#   for_each = var.subnetworks

#   subnets = [
#     {
#       subnet_name   = "${each.key}-subnet"
#       subnet_ip     = each.value.cidr_block
#       subnet_region = each.value.region
#       private_ip_google_access = true
#     }
#   ]

#   secondary_ranges = {
#     "${each.key}-subnet" = [
#       {
#         range_name    = "${each.key}-pods-ip-range"
#         ip_cidr_range = each.value.cluster_pod_block
#       },
#       {
#         range_name    = "${each.key}-svc-ip-range"
#         ip_cidr_range = each.value.cluster_svc_block
#       }
#     ]
#   }
# }

# resource "google_compute_global_address" "cloud-sql-range" {
#   name          = "cloud-uat-sql-range"
#   purpose       = "VPC_PEERING"
#   address_type  = "INTERNAL"
#   network       = module.vpc["uat"].network_self_link
#   prefix_length = 24
#   address = "10.192.54.0"
  
# }

# resource "google_service_networking_connection" "sql-uat-connection" {
#   network                 = module.vpc["uat"].network_self_link
#   service                 = "servicenetworking.googleapis.com"
#   reserved_peering_ranges = [google_compute_global_address.cloud-sql-range.name]
# }


# module "cloud_router" {
#   source  = "terraform-google-modules/cloud-router/google"
#   version = "~> 0.4"

#   project = var.project_id
#   region  = var.region

#   name = "cluster-uat-router"

#   for_each = var.subnetworks

#   network = module.vpc[each.key].network_self_link
#   nats = [{
#     name = "uat-cluster-nat-gateway"
#   }]
# }