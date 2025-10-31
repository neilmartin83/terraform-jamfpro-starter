locals {
  microsoft_office_app_names = {
    "word"       = "Microsoft Word 365"
    "excel"      = "Microsoft Excel 365"
    "powerpoint" = "Microsoft PowerPoint 365"
    "outlook"    = "Microsoft Outlook 365"
    "onenote"    = "Microsoft OneNote 365"
    "teams"      = "Microsoft Teams"
  }
}

resource "jamfpro_app_installer" "microsoft_office" {
  for_each                           = local.microsoft_office_app_names
  app_title_name                     = each.value
  name                               = each.value
  enabled                            = true
  deployment_type                    = "SELF_SERVICE"
  update_behavior                    = "AUTOMATIC"
  category_id                        = var.category_ids["applications"]
  site_id                            = "-1"
  smart_group_id                     = var.computer_smart_group_model_ids["laptops"]
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
