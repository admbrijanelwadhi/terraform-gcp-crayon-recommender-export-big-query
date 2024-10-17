provider "google" {
  project = var.project_id
}

data "google_project" "project" {
}

data "google_bigquery_dataset" "_dataset" {
  dataset_id = var.dataset_id
}

locals {
  current_time_utc = timestamp()                 # Gets the current time in UTC
  custom_time      = timeadd(timestamp(), "24h") # Add 24 hours (you can adjust as needed)
}

output "formatted_time" {
  value = replace(local.custom_time, " ", "T") # Replace the space with 'T' for ISO 8601 format
}


resource "google_bigquery_data_transfer_config" "query_config" {

  display_name           = var.display_name
  data_source_id         = "6063d10f-0000-2c12-a706-f403045e6250"
  schedule               = "every 24 hours"
  location               = var.location
  destination_dataset_id = data.google_bigquery_dataset._dataset.dataset_id
  disabled = false
  params = {
    organization_id = var.organization_id
  }
  service_account_name = var.service_account
  email_preferences {
    enable_failure_email = false
  }

  schedule_options {
    start_time = local.custom_time
  }
}
