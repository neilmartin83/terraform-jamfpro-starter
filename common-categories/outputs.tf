output "jamfpro_category_ids" {
  description = "The IDs of the common Jamf Pro categories created."
  value       = { for k, r in jamfpro_category.common : k => r.id }
}
