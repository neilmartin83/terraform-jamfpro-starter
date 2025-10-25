variable "category_ids" {
  description = "Map of category keys to Jamf Pro category names."
  type        = map(string)
}

variable "computer_smart_group_model_ids" {
  description = "Map of smart group model keys to Jamf Pro smart computer group names."
  type        = map(string)
}

variable "package_ids" {
  description = "Map of package keys to Jamf Pro package IDs"
  type        = map(string)
}
