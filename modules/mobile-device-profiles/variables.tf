# https://learn.jamf.com/en-US/bundle/jamf-pro-documentation-current/page/Mobile_Device_Configuration_Profiles.html

variable "category_ids" {
  description = "Map of category keys to Jamf Pro category names."
  type        = map(string)
}
