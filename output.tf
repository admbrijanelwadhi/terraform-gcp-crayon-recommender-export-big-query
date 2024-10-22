output "transfer_config" {
  value = google_bigquery_data_transfer_config.transfer_config
}

output "formatted_time" {
  value = replace(local.current_time_utc, " ", "T") # Replace the space with 'T' for ISO 8601 format
}

output "dataset_id" {
  value = google_bigquery_dataset.dataset_recommendation
}