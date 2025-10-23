terraform {
  required_providers {
    jamfpro = {
      source  = "deploymenttheory/jamfpro"
      version = "0.27.0"
    }
  }
}

resource "jamfpro_app_installer" "microsoft_intune_company_portal" {
  app_title_name  = "Microsoft Intune Company Portal"
  name            = "Microsoft Intune Company Portal"
  enabled         = true
  deployment_type = "INSTALL_AUTOMATICALLY"
  update_behavior = "AUTOMATIC"
  category_id     = var.category_ids["Applications (Managed By Terraform)"]
  site_id         = "-1"
  smart_group_id  = var.smart_group_model_ids["Laptops"]

  install_predefined_config_profiles = true
  trigger_admin_notifications        = false

  notification_settings {
    notification_interval = 0
    deadline              = 0
    quit_delay            = 0
    relaunch              = false
    suppress              = false
  }

  self_service_settings {
    include_in_featured_category   = false
    include_in_compliance_category = false
    force_view_description         = false
  }
}

resource "jamfpro_macos_configuration_profile_plist" "single_sign_on_extension" {
  name                = "Single Sign-On Extension - Entra ID"
  description         = ""
  level               = "System"
  distribution_method = "Install Automatically"
  redeploy_on_update  = "All"
  payloads            = file("${path.module}/support-files/Single-Sign-on-Extension-Entra-ID-macOS.mobileconfig")
  payload_validate    = true
  user_removable      = false
  category_id         = var.category_ids["Global (Managed By Terraform)"]

  scope {
    all_computers      = false
    all_jss_users      = false
    computer_group_ids = [var.smart_group_model_ids["Laptops"]]
  }
}
