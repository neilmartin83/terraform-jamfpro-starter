resource "jamfpro_macos_configuration_profile_plist" "security_and_privacy_laptops" {
  name                = "Security and Privacy - Laptops (Managed by Terraform)"
  description         = ""
  level               = "System"
  distribution_method = "Install Automatically"
  redeploy_on_update  = "All"
  payloads            = file("${path.module}/support-files/security-and-privacy-laptops.mobileconfig")
  payload_validate    = true
  user_removable      = false
  category_id         = var.category_ids["global"]

  scope {
    all_computers      = false
    all_jss_users      = false
    computer_group_ids = [var.computer_smart_group_model_ids["laptops"]]
  }
}

resource "jamfpro_macos_configuration_profile_plist" "security_and_privacy_desktops" {
  name                = "Security and Privacy - Desktops (Managed by Terraform)"
  description         = ""
  level               = "System"
  distribution_method = "Install Automatically"
  redeploy_on_update  = "All"
  payloads            = file("${path.module}/support-files/security-and-privacy-desktops.mobileconfig")
  payload_validate    = true
  user_removable      = false
  category_id         = var.category_ids["global"]

  scope {
    all_computers      = false
    all_jss_users      = false
    computer_group_ids = [var.computer_smart_group_model_ids["desktops"]]
  }
}
