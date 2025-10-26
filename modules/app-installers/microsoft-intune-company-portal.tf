resource "jamfpro_app_installer" "microsoft_intune_company_portal" {
  app_title_name                     = "Microsoft Intune Company Portal"
  name                               = "Microsoft Intune Company Portal"
  enabled                            = true
  deployment_type                    = "INSTALL_AUTOMATICALLY"
  update_behavior                    = "AUTOMATIC"
  category_id                        = var.category_ids["Applications (Managed by Terraform)"]
  site_id                            = "-1"
  smart_group_id                     = var.computer_smart_group_model_ids["Laptops"]
  install_predefined_config_profiles = true
  trigger_admin_notifications        = true
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
