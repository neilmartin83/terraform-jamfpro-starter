terraform {
  required_providers {
    jamfplatform = {
      source  = "Jamf-Concepts/jamfplatform"
      version = ">= 0.2.0"
    }
    jamfpro = {
      source  = "deploymenttheory/jamfpro"
      version = "0.26.0"
    }
  }
}

data "jamfpro_group" "smart_group_models" {
  for_each         = var.smart_group_model_ids
  group_jamfpro_id = each.value
  group_type       = "COMPUTER"
}

resource "jamfplatform_blueprints_blueprint" "software_update_settings" {
  name        = "Software Update Settings"
  description = "Managed by Terraform"

  device_groups = [for group in data.jamfpro_group.smart_group_models : group.group_platform_id]

  software_update_settings {
    allow_standard_user_os_updates           = true
    automatic_download                       = "AlwaysOn"
    automatic_install_os_updates             = "AlwaysOn"
    automatic_install_security_updates       = "AlwaysOn"
    deferral_combined_period_days            = 7
    deferral_major_period_days               = 30
    deferral_minor_period_days               = 14
    deferral_system_period_days              = 3
    notifications_enabled                    = true
    rapid_security_response_enabled          = true
    rapid_security_response_rollback_enabled = false
    recommended_cadence                      = "Newest"
  }
}
