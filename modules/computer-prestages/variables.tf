variable "automated_device_enrollment_id" {
  description = "Automated Device Enrollment ID"
  type        = string
}

variable "computer_profile_ids" {
  description = "Map of computer profile IDs to be assigned during prestage enrollment"
  type        = map(string)
}

variable "package_ids" {
  description = "Map of package IDs to be installed during prestage enrollment"
  type        = map(string)
}
