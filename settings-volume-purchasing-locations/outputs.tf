output "volume_purchasing_location_id" {
  description = "Volume Purchasing Location ID (or null if not created)"
  value       = length(jamfpro_volume_purchasing_locations.default) > 0 ? tonumber(jamfpro_volume_purchasing_locations.default[0].id) : null
}

output "volume_purchasing_location_data" {
  description = "Volume Purchasing Location Data (or null if not created)"
  value       = length(data.jamfpro_volume_purchasing_locations.default) > 0 ? data.jamfpro_volume_purchasing_locations.default[0] : null
}
