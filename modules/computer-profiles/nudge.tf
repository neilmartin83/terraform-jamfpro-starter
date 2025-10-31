resource "jamfpro_macos_configuration_profile_plist" "nudge" {
  name                = "Nudge (Managed by Terraform)"
  description         = ""
  level               = "System"
  distribution_method = "Install Automatically"
  redeploy_on_update  = "All"
  payloads            = file("${path.module}/support-files/nudge.mobileconfig")
  payload_validate    = true
  user_removable      = false
  category_id         = var.category_ids["applications"]
  scope {
    all_computers = false
    all_jss_users = false
    computer_group_ids = [
      var.computer_smart_group_ids["laptops"]
    ]
  }
}
