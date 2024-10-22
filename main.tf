provider "google" {

}

data "google_project" "project" {
}


locals {
  current_time_utc = timestamp()                 # Gets the current time in UTC
 
}

resource "google_bigquery_dataset" "dataset_recommendation" {
  dataset_id                  = var.dataset_id
  description                 = "This dataset is responsible to store the recommendations"
  location                    = var.location

  labels = var.labels
}

module "crayon-permission" {
  source  = "admbrijanelwadhi/crayon-permission/gcp"
  version = "0.0.1"
  organization_id = var.organization_id
  billing_account_id = var.billing_account_id
  project_id = var.project_id

  project_roles = {
     "roles/billing.resourceCosts.get" = [var.service_account]
  }
  
  billing_roles = {
     "roles/billing.accounts.getSpendingInformation" = [var.service_account]
  }

  organization_roles = {
    "roles/recommender.exporter" = [var.service_account]
  }

}


resource "google_bigquery_data_transfer_config" "transfer_config" {

  display_name           = var.display_name
  data_source_id         = "6063d10f-0000-2c12-a706-f403045e6250"
  schedule               = "every 24 hours"
  location               = var.location
  destination_dataset_id = google_bigquery_dataset.dataset_recommendation.dataset_id
  disabled = false
  params = {
    organization_id = var.organization_id
  }
  service_account_name = var.service_account
  email_preferences {
    enable_failure_email = false
  }
  
  schedule_options {
    start_time = local.current_time_utc
    
  }
}
