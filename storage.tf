# variable "storagebuckets" {
#   type = map(object({
#     project       = string
#     location      = string
#     force_destroy = bool
#   }))
#   default = {
#     bucket-credits = {
#     project       = "credits-340817"
#     location      ="us-east1"
#     force_destroy = true
#     }
#   }
# }

# locals {
#  bucket-credits = {
#    "smartcredit-files-dev" = { force_destroy = true, location = "us-east1", project = "credits-340817", name = "smartcredit-files-dev" },
#    "smartcredit-files-qa" = { force_destroy = true, location = "us-east1", project = "credits-340817", name = "smartcredit-files-qa" },
#    "workflow-files-dev" = { force_destroy = true, location = "us-east1", project = "credits-340817", name = "workflow-files-dev" },
#    "workflow-files-qa" =  { force_destroy = true, location = "us-east1", project = "credits-340817", name = "workflow-files-qa" },
#  }
# }

resource "google_storage_bucket" "storagebuckets" {

  for_each      = var.bucket-credits
  project       = var.bucket-credits[each.key].project
  name          = var.bucket-credits[each.key].name
  location      = var.bucket-credits[each.key].location
  force_destroy = var.bucket-credits[each.key].force_destroy
}

// ================= DEV-QA ==================

#   resource "google_storage_bucket" "smartcredit-files-dev" {
#   for_each      = var.storagebuckets
#   project       = each.value.project
#   name          = "smartcredit-files-dev"
#   location      = each.value.location
#   force_destroy = each.value.force_destroy
# }

# resource "google_storage_bucket" "workflow-files-qa" {
#   for_each      = var.storagebuckets
#   project       = each.value.project
#   name          = "workflow-files-qa"
#   location      = each.value.location
#   force_destroy = each.value.force_destroy
# }

#   resource "google_storage_bucket" "smartcredit-files-qa" {
#   for_each      = var.storagebuckets
#   project       = each.value.project
#   name          = "smartcredit-files-qa"
#   location      = each.value.location
#   force_destroy = each.value.force_destroy
# }

# resource "google_storage_bucket" "workflow-files-dev" {
#   for_each      = var.storagebuckets
#   project       = each.value.project
#   name          = "workflow-files-dev"
#   location      = each.value.location
#   force_destroy = each.value.force_destroy
# }

// ================== UAT =====================

# resource "google_storage_bucket" "workflow-files-uat" {
#   for_each      = var.storagebuckets
#   project       = each.value.project
#   name          = "workflow-files-uat"
#   location      = each.value.location
#   force_destroy = each.value.force_destroy
# }

# resource "google_storage_bucket" "smartcredit-files-uat" {
#   for_each      = var.storagebuckets
#   project       = each.value.project
#   name          = "smartcredit-files-uat"
#   location      = each.value.location
#   force_destroy = each.value.force_destroy
# }

//========================== PROD =========================================

# resource "google_storage_bucket" "smartcredit-files-uat" {
#   project       =  var.project_id
#   name          = "smartcredit-files-uat"
#   location      = var.region
#   force_destroy = true
# }

# resource "google_storage_bucket" "smartcredit-files-qa" {
#   project       =  var.project_id
#   name          = "smartcredit-files-qa"
#   location      = var.region
#   force_destroy = true
# }

# resource "google_storage_bucket" "smartcredit-files-dev" {
#   project       =  var.project_id
#   name          = "smartcredit-files-dev"
#   location      = var.region
#   force_destroy = true
# }


# resource "google_storage_bucket" "workflow-files-uat" {
#   project       = var.project_id
#   name          = "workflow-files-uat"
#   location      = var.region
#   force_destroy = true
# }

# resource "google_storage_bucket" "workflow-files-qa" {
#   project       = var.project_id
#   name          = "workflow-files-qa"
#   location      = var.region
#   force_destroy = true
# }

