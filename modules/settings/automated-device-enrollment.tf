resource "jamfpro_device_enrollments" "default" {
  count         = var.automated_device_enrollment_token != null ? 1 : 0
  name          = "Default (Managed by Terraform)"
  encoded_token = base64encode(var.automated_device_enrollment_token)
}
