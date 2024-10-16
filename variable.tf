variable "project_id" {
  description = "GCP project_id"
  type        = string
}

variable "display_name" {
  description = "display name for job"
  type        = string
}


variable "service_account" {
  description = "service account name"
  type        = string
}


variable "dataset_id" {
  description = "Existing Data set Id to collect the recommendation"
  type        = string
}


variable "location" {
  description = "location for job should be same as Big quesy dataset"
  type        = string
}

variable "organization_id" {
  description = "organization_id"
  type        = string
}

