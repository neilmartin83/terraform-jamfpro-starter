variable "computer_smart_group_model_ids" {
  description = "Map of smart group model keys to Jamf Pro smart computer group names."
  type        = map(string)
}

variable "mobile_device_smart_group_model_ids" {
  description = "Map of smart group model keys to Jamf Pro smart mobile device group IDs."
  type        = map(string)
}
