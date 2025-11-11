# https://learn.jamf.com/en-US/bundle/jamf-pro-blueprints-configuration-guide/page/Jamf_Pro_Blueprints_Configuration_Guide.html

variable "computer_smart_group_ids" {
  description = "Map of smart group keys to Jamf Pro smart computer group IDs."
  type        = map(string)
}

variable "mobile_device_smart_group_ids" {
  description = "Map of smart group keys to Jamf Pro smart mobile device group IDs."
  type        = map(string)
}
