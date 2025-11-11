# https://learn.jamf.com/en-US/bundle/jamf-compliance-benchmarks-configuration-guide/page/Compliance_Benchmarks_Configuration_Guide.html

variable "computer_smart_group_ids" {
  description = "Map of smart group keys to Jamf Pro smart computer group IDs."
  type        = map(string)
}
