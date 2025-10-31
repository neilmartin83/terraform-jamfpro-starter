output "building_ids" {
  description = "The IDs of the common Jamf Pro buildings created."
  value       = { for k, r in jamfpro_building.common : k => r.id }
}

output "department_ids" {
  description = "The IDs of the common Jamf Pro departments created."
  value       = { for k, r in jamfpro_department.department : k => r.id }
}

output "category_ids" {
  description = "The IDs of the common Jamf Pro categories created."
  value       = { for k, r in jamfpro_category.common : k => r.id }
}

output "automated_device_enrollment_id" {
  description = "Automated Device Enrollment ID (or null if not created)"
  value       = length(jamfpro_device_enrollments.default) > 0 ? jamfpro_device_enrollments.default[0].id : null
}

output "volume_purchasing_location_id" {
  description = "Volume Purchasing Location ID (or null if not created)"
  value       = length(jamfpro_volume_purchasing_locations.default) > 0 ? tonumber(jamfpro_volume_purchasing_locations.default[0].id) : null
}

output "volume_purchasing_location_data" {
  description = "Volume Purchasing Location Data (or null if not created)"
  value       = length(data.jamfpro_volume_purchasing_locations.default) > 0 ? data.jamfpro_volume_purchasing_locations.default[0] : null
}
