terraform {
  backend "gcs" {
    bucket = "unicomer-infrastructure-tfstate"
    prefix = "tfstates/credits/"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.8.0"
    }
    argocd = {
      source  = "oboukili/argocd"
      version = "2.2.6"
    }
  }
}

# locals {
#   environments = {
#     "UnicomerDevQA" : local.UnicomerDevQA,
#     "UnicomerUAT" : local.UnicomerUAT,
#     "UnicomerPROD" : local.UnicomerPROD,
#     "Data" : local.Data
#   }
# }

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# provider "google-beta" {
#   project = var.project_id
#   region  = var.region
#   zone    = var.zone
# }

provider "argocd" {
  server_addr = "35.237.92.219:443"
  insecure    = true
  auth_token  = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJhcmdvY2QiLCJzdWIiOiJkZXBsb3llcjphcGlLZXkiLCJuYmYiOjE2NDc4ODgxNjQsImlhdCI6MTY0Nzg4ODE2NCwianRpIjoiQVJHT0NEX0FVVEhfVE9LRU4ifQ.fugIXjCIWsBPGouE2SaWmzk-tsngNXafYMdp6ycLSjM"
}
