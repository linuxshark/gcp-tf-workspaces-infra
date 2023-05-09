# variable {
#   network-name = "credits-prod-network"
#   network-name-sql = "credits-prod-network-sql"
# }

# variable "subnetworks" {
#   type = map(object({
#     cidr_block        = string
#     region            = string
#     cluster_pod_block = string
#     cluster_svc_block = string
#   }))
#   default = {
#     prod = {
#       cidr_block        = "10.192.66.128/26",
#       region            = "us-east1",
#       cluster_pod_block = "10.193.160.0/20",
#       cluster_svc_block = "10.192.66.0/25"
#     }
#   }
# }

# variable "subnetworks-sql" {
#   type = map(object({
#     cidr_block = string
#     region     = string
#   }))
#   default = {
#     var.env-sql = {
#       cidr_block = "190.62.8.234/26",
#       region     = "us-east1",
#     }
#   }
# }

module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = ">= 4.0.1, < 5.0.0"

  project_id   = var.project_id
  network_name = var.network
  routing_mode = "GLOBAL"

  for_each = var.subnetworks

  subnets = [
    {
      subnet_name              = "${var.env}-subnet"
      subnet_ip                = var.subnetworks[each.key].cidr_block
      subnet_region            = var.subnetworks[each.key].region
      private_ip_google_access = true
    }
  ]

  secondary_ranges = {
    "${var.env}-subnet" = [
      {
        range_name    = "${var.env}-pods-ip-range"
        ip_cidr_range = var.subnetworks[each.key].cluster_pod_block
      },
      {
        range_name    = "${var.env}-svc-ip-range"
        ip_cidr_range = var.subnetworks[each.key].cluster_svc_block
      }
    ]
  }
}

# resource "google_compute_global_address" "cloud-sql-range" {
#   name          = var.cloud_sql_range_name //"cloud-${var.env}-sql-range"
#   purpose       = "VPC_PEERING"
#   address_type  = "INTERNAL"

#   for_each = var.subnetworks

#   network       = module.vpc[each.key].network_self_link //module.vpc.network_self_link
#   prefix_length = 24
#   address       = "10.192.54.0" //10.192.70.0"

# }

# resource "google_service_networking_connection" "sql-connection" {
#   network                 = module.vpc.network_self_link
#   service                 = "servicenetworking.googleapis.com"
#   reserved_peering_ranges = [google_compute_global_address["cloud-${var.env}-sql-range".name]]
# }


module "cloud_router" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "~> 0.4"

  project = var.project_id
  region  = var.region

  name = var.cluster_router_name //"cluster-${var.env}-router"

  for_each = var.subnetworks

  network = module.vpc[each.key].network_self_link
  nats = [{
    name = var.cluster_nat_gateway_name //"${var.env}-cluster-nat-gateway"
  }]
}


# Global IP Reservation


#resource "google_compute_global_address" "carmor-kong-dev" {
#   name         = var.master_publicip_kong_name_dev
#   ip_version   = "IPV4"
#   address_type = "EXTERNAL"
# }

# resource "google_compute_global_address" "carmor-kc-dev" {
#   name         = var.master_publicip_kong_name_dev
#   ip_version   = "IPV4"
#   address_type = "EXTERNAL"
# }

# resource "google_compute_global_address" "carmor-kong-qa" {
#   name         = var.master_publicip_kong_name_qa
#   ip_version   = "IPV4"
#   address_type = "EXTERNAL"
# }

# resource "google_compute_global_address" "carmor-kc-qa" {
#   name         = var.master_publicip_kong_name_qa
#   ip_version   = "IPV4"
#   address_type = "EXTERNAL"
# }

# resource "google_compute_global_address" "carmor-kong-uat" {
#   name         = var.master_publicip_kong_name_uat
#   ip_version   = "IPV4"
#   address_type = "EXTERNAL"
# }

# resource "google_compute_global_address" "carmor-kc-uat" {
#   name         = var.master_publicip_kong_name_uat
#   ip_version   = "IPV4"
#   address_type = "EXTERNAL"
# }
