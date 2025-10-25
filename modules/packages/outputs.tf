output "package_ids" {
  description = "The IDs of the common Jamf Pro packages created."
  value       = { for k, r in jamfpro_package.default : k => r.id }
}
