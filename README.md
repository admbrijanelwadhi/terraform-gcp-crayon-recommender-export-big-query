# Terraform Module: BigQuery Data Transfer Configuration

This Terraform module is designed to set up a BigQuery data transfer configuration within a Google Cloud project. The module creates the necessary permissions and schedules the data transfer from a specified data source to a BigQuery dataset.

## Requirements

- Terraform 0.13+
- Google Cloud Platform (GCP) project
- GCP Service Account with the appropriate permissions for BigQuery Data Transfer and IAM

## Usage

```
module "bigquery_transfer" {
  source            = "./path-to-your-module"
  project_id        = "your-gcp-project-id"
  dataset_id        = "your-bigquery-dataset-id"
  display_name      = "Your Transfer Config Display Name"
  organization_id   = "Your organization ID"  #
  service_account   = "pyour-service-account-email@your-project.iam.gserviceaccount.com"
  location          = "EU"  # Location of the dataset (e.g., US, EU)
}

