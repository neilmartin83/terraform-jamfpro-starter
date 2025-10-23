variable "tfc_organization" {
  description = "The Terraform Cloud organization name."
  sensitive   = false
  default     = ""
}

variable "tfc_workspace" {
  description = "The Terraform Cloud workspace name."
  sensitive   = false
  default     = ""
}

variable "jamfplatform_base_url" {
  description = "The base URL for the Jamf Platform API. Example: https://us.apigw.jamf.com"
  sensitive   = true
  default     = ""
}

variable "jamfplatform_client_id" {
  description = "The Jamf Platform Client ID for authentication."
  sensitive   = true
  default     = ""
}

variable "jamfplatform_client_secret" {
  description = "The Jamf Platform Client secret for authentication."
  sensitive   = true
  default     = ""
}

variable "jamfpro_instance_fqdn" {
  description = "The Jamf Pro FQDN (fully qualified domain name). Example: https://mycompany.jamfcloud.com"
  sensitive   = true
  default     = ""
}

variable "jamfpro_auth_method" {
  description = "The auth method chosen for interacting with Jamf Pro. Options are 'basic' for username/password or 'oauth2' for client id/secret."
  sensitive   = true
  default     = ""
}

variable "jamfpro_client_id" {
  description = "The Jamf Pro Client ID for authentication when auth_method is 'oauth2'."
  sensitive   = true
  default     = ""
}

variable "jamfpro_client_secret" {
  description = "The Jamf Pro Client secret for authentication when auth_method is 'oauth2'."
  sensitive   = true
  default     = ""
}

variable "volume_purchasing_service_token" {
  type        = string
  description = "Base64 encoded Volume Purchasing Service Token content (cat /path/to/token | pbcopy). If not provided, no Volume Purchasing Location will be created."
  default     = null
}
