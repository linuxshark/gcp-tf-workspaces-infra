variable "k8s-clusters" {
  type = map(object({
    cluster_location = string
    node_locations   = list(string)
    nodes_per_zone   = number
    machine          = string
    network          = string
  }))
  default = {
    uat = {
      cluster_location = "us-east1"
      node_locations   = ["us-east1-b", "us-east1-c"] //, "us-east1-d"]
      nodes_per_zone   = 2
      machine          = "n1-custom-4-12288"
      network          = "uat-network"
    }
  }
}

resource "google_container_node_pool" "primary_default_pool" {
  name       = "default-pool-credits"
  cluster    = google_container_cluster.k8s_cluster["uat"].id
  for_each =  var.k8s-clusters
  node_count = each.value.nodes_per_zone

  node_config {
    preemptible  = false
    machine_type = each.value.machine

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

resource "google_container_cluster" "k8s_cluster" {
  for_each = var.k8s-clusters

  name = "${each.key}-cluster"

  location           = each.value.cluster_location
  node_locations     = each.value.node_locations
  initial_node_count = 1

  network    = module.vpc[each.key].network_self_link
  subnetwork = module.vpc[each.key].subnets_names[0]

  remove_default_node_pool = true

  ip_allocation_policy {
    cluster_secondary_range_name  = "${each.key}-pods-ip-range"
    services_secondary_range_name = "${each.key}-svc-ip-range"
  }

  # node_config {
  #   machine_type = "e2-small"
  # }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "10.192.58.192/28"
  }

   master_authorized_networks_config {
     cidr_blocks {
      # cidr_block   = "${module.bastion[each.key].ip_address}/32"
      cidr_block   = "190.86.34.44/32"
      display_name = "IP Publica Christian"
     }
   } 
}