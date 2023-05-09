variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in"
}

variable "region" {
  type        = string
  description = "The region to host the cluster in"
}

variable "zone" {
  type        = string
  description = "The zone to host the cluster in"
}

variable "k8s-cluster" {
  type = map(object({
    name             = string
    cluster_location = string
    node_locations   = list(string)
    nodes_per_zone   = number
    machine          = string
    network          = string
  }))
  default = {
    "bucket-credits" = {
      cluster_location = "value"
      machine          = "value"
      name             = "value"
      network          = "value"
      node_locations   = ["value"]
      nodes_per_zone   = 1
    }
  }
}

variable "env" {
  type = string
}

variable "subnetworks" {
  type = map(object({
    cidr_block        = string
    region            = string
    cluster_pod_block = string
    cluster_svc_block = string
  }))
}

variable "master_ipv4_cidr_block" {
  type = string
}

variable "network" {
  type = string
}

variable "network-sql" {
  type = string
}

variable "repository_id" {
  type = string
}

variable "repository_description" {
  type = string
}

variable "repository_format" {
  type = string
}

variable "secrets" {
  type = list(object({
    project       = string
    name          = string
    type          = string
    environment   = string
    secret_values = string
  }))
}

variable "bucket-credits" {
  type = map(object({
    project       = string
    location      = string
    force_destroy = bool
    name          = string
  }))
}

# variable "storagebuckets" {
#   type = map(object({
#     project       = string
#     location      = string
#     force_destroy = bool
#     name = string
#   }))
# }

variable "storagebuckets-names" {
  type = list(string)
}

variable "cluster_router_name" {
  type = string
}

variable "cluster_nat_gateway_name" {
  type = string
}

variable "cloud_sql_range_name" {
  type = string
}


variable "master_publicip_kong_name_dev" {
  type        = string
  description = "The cloud armor global ip address for kong"
  default     = "cloudarmor-kong-ip-dev"
}
variable "master_publicip_kc_name_dev" {
  type        = string
  description = "The cloud armor global ip address for Keycloack"
  default     = "cloudarmor-kc-ip-dev"
}

variable "master_publicip_kong_name_qa" {
  type        = string
  description = "The cloud armor global ip address for kong"
  default     = "cloudarmor-kong-ip-qa"
}
variable "master_publicip_kc_name_qa" {
  type        = string
  description = "The cloud armor global ip address for Keycloack"
  default     = "cloudarmor-kc-ip-qa"
}

variable "master_publicip_kong_name_uat" {
  type        = string
  description = "The cloud armor global ip address for kong"
  default     = "cloudarmor-kong-ip-uat"
}
variable "master_publicip_kc_name_uat" {
  type        = string
  description = "The cloud armor global ip address for Keycloack"
  default     = "cloudarmor-kc-ip-uat"
}


