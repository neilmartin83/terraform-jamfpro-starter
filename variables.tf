
variable "jamfplatform_base_url" {
  description = "The base URL for the Jamf Platform API. Example: https://us.apigw.jamf.com"
  type        = string
  sensitive   = true
  default     = null
}

variable "jamfplatform_client_id" {
  description = "The Jamf Platform Client ID for authentication."
  type        = string
  sensitive   = true
  default     = null
}

variable "jamfplatform_client_secret" {
  description = "The Jamf Platform Client secret for authentication."
  type        = string
  sensitive   = true
  default     = null
}

variable "jamfpro_instance_fqdn" {
  description = "The Jamf Pro FQDN (fully qualified domain name). Example: https://mycompany.jamfcloud.com"
  type        = string
  sensitive   = true
  default     = null
}

variable "jamfpro_client_id" {
  description = "The Jamf Pro Client ID for authentication when auth_method is 'oauth2'."
  type        = string
  sensitive   = true
  default     = null
}

variable "jamfpro_client_secret" {
  description = "The Jamf Pro Client secret for authentication when auth_method is 'oauth2'."
  type        = string
  sensitive   = true
  default     = null
}

variable "automated_device_enrollment_token" {
  type        = string
  description = "Automated Device Enrollment Token content (cat /path/to/token | pbcopy). If not provided, no Automated Device Enrollment will be created."
  default     = null
}

variable "volume_purchasing_service_token" {
  type        = string
  description = "Volume Purchasing Service Token content (cat /path/to/token | pbcopy). If not provided, no Volume Purchasing Location will be created."
  default     = null
}
