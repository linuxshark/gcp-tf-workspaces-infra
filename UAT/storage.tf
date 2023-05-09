variable "storagebuckets" {
  type = map(object({
    project       = string
    location      = string
    force_destroy = bool
  }))
  default = {
    bucket-credits = {
    project       = "credits-340817"
    location      ="us-east1"
    force_destroy = true
    }
  }
}

resource "google_storage_bucket" "smartcredit-files-uat" {
  for_each      = var.storagebuckets
  project       = each.value.project
  name          = "smartcredit-files-uat"
  location      = each.value.location
  force_destroy = each.value.force_destroy
}

resource "google_storage_bucket" "workflow-files-uat" {
  for_each      = var.storagebuckets
  project       = each.value.project
  name          = "workflow-files-uat"
  location      = each.value.location
  force_destroy = each.value.force_destroy
}