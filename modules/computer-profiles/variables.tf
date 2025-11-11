# https://learn.jamf.com/en-US/bundle/jamf-pro-documentation-current/page/Computer_Configuration_Profiles.html

variable "category_ids" {
  description = "Map of category keys to Jamf Pro category names."
  type        = map(string)
}

variable "computer_smart_group_ids" {
  description = "Map of smart group keys to Jamf Pro smart computer group IDs."
  type        = map(string)
}
