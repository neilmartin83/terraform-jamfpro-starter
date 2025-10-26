resource "jamfpro_macos_configuration_profile_plist" "sso_extension_entra_id" {
  name                = "Single Sign-On Extension - Entra ID (Managed by Terraform)"
  description         = ""
  level               = "System"
  distribution_method = "Install Automatically"
  redeploy_on_update  = "All"
  payloads            = file("${path.module}/support-files/sso-extension-entra-id.mobileconfig")
  payload_validate    = true
  user_removable      = false
  category_id         = var.category_ids["Global (Managed by Terraform)"]

  scope {
    all_computers      = false
    all_jss_users      = false
    computer_group_ids = [var.computer_smart_group_model_ids["Laptops"]]
  }
}
