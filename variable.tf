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
  description = "Data set Id to collect the recommendation"
  type        = string
}

variable "location" {
  description = "location for job should be same as Big quesy dataset eg. eu , us "
  type        = string
}

variable "organization_id" {
  description = "organization id"
  type        = string
}

variable "labels" {
  description = "Lables for Dataset"
  type    = map(string)
  default = {}  # Default to an empty map if no labels are passed
}

variable "billing_account_id" {
  description = "billing account id"
  type        = string
}
