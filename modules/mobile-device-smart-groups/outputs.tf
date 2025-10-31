output "group_ids" {
  description = "Map of smart group key -> jamf smart group id"
  value = merge(
    { "all_managed" = jamfpro_smart_mobile_device_group.all_managed.id },
    { for k, g in jamfpro_smart_mobile_device_group.model : k => g.id }
  )
}
