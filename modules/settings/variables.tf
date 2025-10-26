variable "automated_device_enrollment_token" {
  type        = string
  description = "Device Enrollment Token content (cat /path/to/token | pbcopy). If not provided, no Automated Device Enrollment profile will be created."
  default     = null
  validation {
    condition = var.automated_device_enrollment_token == null || (
      can(regex("^Content-Type: application/pkcs7-mime", var.automated_device_enrollment_token))
    )
    error_message = "Invalid Device Enrollment Token content - must be a valid PKCS7 MIME file"
  }
}

variable "volume_purchasing_service_token" {
  type        = string
  description = "Volume Purchasing Service Token content (cat /path/to/token | pbcopy). If not provided, no Volume Purchasing Location will be created."
  default     = null
  validation {
    condition     = var.volume_purchasing_service_token == null ? true : can(base64decode(var.volume_purchasing_service_token))
    error_message = "The provided string is not a valid base64 encoded content"
  }
  validation {
    condition = (
      var.volume_purchasing_service_token == null ? true :
      try(
        jsondecode(base64decode(var.volume_purchasing_service_token)).expDate != null &&
        jsondecode(base64decode(var.volume_purchasing_service_token)).token != null &&
        jsondecode(base64decode(var.volume_purchasing_service_token)).orgName != null,
        false
      )
    )
    error_message = "The token must contain valid 'expDate', 'token', and 'orgName' fields"
  }
  validation {
    condition = (
      var.volume_purchasing_service_token == null ? true :
      try(
        jsondecode(base64decode(var.volume_purchasing_service_token)).expDate != null &&
        replace(formatdate("YYYYMMDD", plantimestamp()), "-", "") <
        replace(substr(jsondecode(base64decode(var.volume_purchasing_service_token)).expDate, 0, 10), "-", ""),
        false
      )
    )
    error_message = "The token has expired. The expiry date must be in the future"
  }
}
