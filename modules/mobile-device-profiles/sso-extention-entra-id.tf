resource "jamfpro_mobile_device_configuration_profile_plist" "sso_extention_entra_id" {
  name               = "Single Sign-On Extension - Entra ID (Managed by Terraform)"
  description        = "terraform-jamfpro-starter/modules/mobile-device-profiles/sso-extention-entra-id.tf"
  level              = "Device Level"
  deployment_method  = "Install Automatically"
  redeploy_on_update = "Newly Assigned"
  category_id        = var.category_ids["global"]
  payloads           = file("${path.module}/support-files/sso-extention-entra-id.mobileconfig")
  scope {
    all_mobile_devices = true
    all_jss_users      = false
  }
}
