output "group_ids" {
  description = "Map of smart group key -> jamf smart group id (Custom groups)"
  value = merge(
    { all_managed = jamfpro_smart_computer_group.all_managed.id },
    { for k, g in jamfpro_smart_computer_group.os_version : k => g.id },
    { for k, g in jamfpro_smart_computer_group.architecture : k => g.id },
    { for k, g in jamfpro_smart_computer_group.model : k => g.id }
  )
}
