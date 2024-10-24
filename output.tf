output "transfer_config" {
  value = google_bigquery_data_transfer_config.transfer_config
}

output "formatted_time" {
  value = replace(var.shedule_time, " ", "T") 
}

output "dataset_id" {
  value = google_bigquery_dataset.dataset_recommendation
}