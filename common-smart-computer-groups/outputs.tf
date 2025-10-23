output "smart_group_os_version_ids" {
  description = "Map of smart group key -> jamf smart group id (OS groups)"
  value       = { for k, g in jamfpro_smart_computer_group.os_version : k => g.id }
}

output "smart_group_architecture_type_ids" {
  description = "Map of smart group key -> jamf smart group id (Architecture type groups)"
  value       = { for k, g in jamfpro_smart_computer_group.architecture_type : k => g.id }
}

output "smart_group_model_ids" {
  description = "Map of smart group key -> jamf smart group id (Model groups)"
  value       = { for k, g in jamfpro_smart_computer_group.model : k => g.id }
}
