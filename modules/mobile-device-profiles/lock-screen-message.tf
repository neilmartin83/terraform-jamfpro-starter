resource "jamfpro_mobile_device_configuration_profile_plist" "lock_screen_1_1" {
  name               = "Lock Screen Message (Managed by Terraform)"
  description        = "terraform-jamfpro-starter/modules/mobile-device-profiles/lock-screen-message.tf"
  level              = "Device Level"
  deployment_method  = "Install Automatically"
  redeploy_on_update = "Newly Assigned"
  category_id        = var.category_ids["global"]
  payloads           = file("${path.module}/support-files/lock-screen-message.mobileconfig")
  scope {
    all_mobile_devices = true
    all_jss_users      = false
  }
}
