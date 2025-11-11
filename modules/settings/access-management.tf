# https://learn.jamf.com/en-US/bundle/technical-articles/page/Configuring_Access_Management_for_Managed_Apple_Accounts_in_the_Jamf_Pro_API.html

resource "jamfpro_access_management_settings" "default" {
  count                                   = var.automated_device_enrollment_token != null ? 1 : 0
  automated_device_enrollment_server_uuid = jamfpro_device_enrollments.default[0].server_uuid
}
