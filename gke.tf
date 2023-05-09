# Default node pool
resource "google_container_node_pool" "primary_default_pool" {

  for_each = var.k8s-cluster

  name    = "default-pool-credits"
  cluster = google_container_cluster.k8s_cluster[var.env].id
  //node_count = var.k8s-cluster.nodes_per_zone
  node_count = each.value.nodes_per_zone

  node_config {
    preemptible  = false
    machine_type = each.value.machine //var.k8s-cluster.machine

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

# Preemptible node pool
# resource "google_container_node_pool" "k8s_preemptible_nodes" {
#   name       = "k8s-preemptible-nodes"
#   cluster    = google_container_cluster.k8s_cluster[var.env].id
#   node_count = 1

#   autoscaling {
#     min_node_count = 3
#     max_node_count = 9
#   }

#   management {
#     auto_repair  = true
#     auto_upgrade = true
#   }

#   node_config {
#     preemptible  = false
#     machine_type = "n1-custom-6-16384"
#     disk_size_gb = 250
#     oauth_scopes = [
#       "https://www.googleapis.com/auth/cloud-platform"
#     ]
#     metadata = {
#       disable-legacy-endpoints = "true"
#     }
#   }
#   # Change how long update operations on the node pool are allowed to take
#   timeouts {
#     update = "20m"
#   }
# }


resource "google_container_cluster" "k8s_cluster" {

  for_each = var.k8s-cluster

  name = "${each.key}-cluster" //"${var.k8s-clusters.name}-cluster"

  location           = each.value.cluster_location //var.k8s-cluster.cluster_location
  node_locations     = each.value.node_locations   //var.k8s-cluster.node_locations
  initial_node_count = 1

  network    = module.vpc[each.key].network_self_link
  subnetwork = module.vpc[each.key].subnets_names[0]

  remove_default_node_pool = true

  ip_allocation_policy {
    cluster_secondary_range_name  = "${each.key}-pods-ip-range" //var.subnetworks[each.key].cluster_pod_block //"${each.key}-pods-ip-range"
    services_secondary_range_name = "${each.key}-svc-ip-range"  //var.subnetworks[each.key].cluster_svc_block //"${each.key}-svc-ip-range"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    //master_ipv4_cidr_block  = "10.192.66.192/28"
    master_ipv4_cidr_block = var.master_ipv4_cidr_block
  }

  master_authorized_networks_config {
    cidr_blocks {
      # cidr_block   = "${module.bastion[each.key].ip_address}/32"
      cidr_block   = "0.0.0.0/0"
      display_name = "Public Access"
    }
  }

  # Enable Workload Identity
  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  maintenance_policy {
    recurring_window {
      start_time = "2022-09-18T00:00:00Z"
      end_time   = "2050-01-01T04:00:00Z"
      recurrence = "FREQ=WEEKLY;BYDAY=SA,SU"
    }
  }
}

# resource "argocd_cluster" "clusters-prod" {
#   provider = argocd
#   server = "https://35.237.92.219:443"
#   name = "prod-cluster"

#   config {
#     tls_client_config {
#       ca_data = base64decode(google_container_cluster.k8s_cluster["prod"].master_auth.0.cluster_ca_certificate)
#     }
#   }
# }


#################

resource "google_container_node_pool" "k8s_secundary_nodes" {
  name       = "k8s-secundary-nodes"
  cluster    = google_container_cluster.k8s_cluster[var.env].id
  node_count = 1

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  # This segment configures the auto upgrade setting to following up
  # upgrade_settings {
  #   strategy = "BLUE_GREEN"
  #   node_pool_soak_duration = 600
  #   batch_percent = 0.25
  #   batch_node_count = 2
  #   batch_soak_duration = 10
  # }

  # upgrade_settings {
  #   strategy  = "SURGE"
  #   max_surge = 3
  #   max_unavailable = 1
  # }

  node_config {
    preemptible  = false
    machine_type = "n1-custom-6-16384"
    disk_size_gb = 250
    #service_account = var.service_account
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
  # Change how long update operations on the node pool are allowed to take
  timeouts {
    update = "20m"
  }
}