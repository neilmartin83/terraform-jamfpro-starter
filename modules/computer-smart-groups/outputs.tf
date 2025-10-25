output "os_version_ids" {
  description = "Map of smart group key -> jamf smart group id (OS groups)"
  value       = { for k, g in jamfpro_smart_computer_group.os_version : k => g.id }
}

output "architecture_type_ids" {
  description = "Map of smart group key -> jamf smart group id (Architecture type groups)"
  value       = { for k, g in jamfpro_smart_computer_group.architecture : k => g.id }
}

output "model_ids" {
  description = "Map of smart group key -> jamf smart group id (Model groups)"
  value       = { for k, g in jamfpro_smart_computer_group.model : k => g.id }
}
