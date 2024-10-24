
terraform {

    required_version = ">= 1.7.4"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">= 6.7.0"
    }
  }
}

provider "google" {
}


# module "crayon-permission" {
#   source  = "admbrijanelwadhi/crayon-permission/gcp"
#   version = "0.0.1"
#   organization_id = "897162993224"
#   billing_account_id = "01C541-31543B-FCB2E0"
#   project_id = "graphite-record-411118"

#   project_roles = {
#      "roles/billing.resourceCosts.get" = ["rayon-finops-gcp-cur@graphite-record-411118.iam.gserviceaccount.com"]
#   }
  
#   billing_roles = {
#      "roles/billing.accounts.getSpendingInformation" = ["rayon-finops-gcp-cur@graphite-record-411118.iam.gserviceaccount.com"]
#   }

# }

module "crayon-recommender-export-big-query" {
  providers = {
    google = google
  }
  source  = "../"
  #version = "0.0.3"
  # insert the 6 required variables here
  dataset_id = "recommendations"
  location = "eu"
  organization_id = "897162993224"
  display_name = "Test2"
  project_id = "graphite-record-411118"
  service_account = "crayon-finops-gcp-cur@graphite-record-411118.iam.gserviceaccount.com"
  billing_account_id = "01C541-31543B-FCB2E0"

}
