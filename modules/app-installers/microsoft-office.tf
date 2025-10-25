locals {
  microsoft_office_apps = {
    "Microsoft Word 365"       = { name = "Microsoft Word 365" }
    "Microsoft Excel 365"      = { name = "Microsoft Excel 365" }
    "Microsoft PowerPoint 365" = { name = "Microsoft PowerPoint 365" }
    "Microsoft Outlook 365"    = { name = "Microsoft Outlook 365" }
    "Microsoft OneNote 365"    = { name = "Microsoft OneNote 365" }
    "Microsoft Teams"          = { name = "Microsoft Teams" }
  }
}

resource "jamfpro_app_installer" "microsoft_office" {
  for_each                           = local.microsoft_office_apps
  app_title_name                     = each.value.name
  name                               = each.value.name
  enabled                            = true
  deployment_type                    = "SELF_SERVICE"
  update_behavior                    = "AUTOMATIC"
  category_id                        = var.category_ids["Applications (Managed By Terraform)"]
  site_id                            = "-1"
  smart_group_id                     = var.computer_smart_group_model_ids["Laptops"]
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
    include_in_featured_category   = true
    include_in_compliance_category = false
    force_view_description         = false
  }
}
