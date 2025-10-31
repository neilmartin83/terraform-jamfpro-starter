variable "category_ids" {
  description = "Map of category keys to Jamf Pro category names."
  type        = map(string)
}

variable "computer_smart_group_ids" {
  description = "Map of smart group keys to Jamf Pro smart computer group IDs."
  type        = map(string)
}

variable "package_ids" {
  description = "Map of package keys to Jamf Pro package IDs"
  type        = map(string)
}
