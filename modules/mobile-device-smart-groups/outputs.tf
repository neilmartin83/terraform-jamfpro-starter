output "model_ids" {
  description = "Map of smart group key -> jamf smart group id (Model groups)"
  value       = { for k, g in jamfpro_smart_mobile_device_group.model : k => g.id }
}
