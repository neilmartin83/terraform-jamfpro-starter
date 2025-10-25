terraform {
  required_providers {
    jamfpro = {
      source  = "deploymenttheory/jamfpro"
      version = "0.27.0"
    }
  }
}

resource "jamfpro_smart_computer_group" "nudge_is_installed" {
  name = "Nudge Is Installed (Managed by Terraform)"
  criteria {
    name        = "Application Bundle ID"
    priority    = 0
    search_type = "is"
    value       = "com.github.macadmins.Nudge"
  }
  criteria {
    and_or      = "and"
    name        = "Application Version"
    priority    = 1
    search_type = "is"
    value       = "2.0.12.81807"
  }
}

resource "jamfpro_policy" "install_nudge" {
  name            = "Install Nudge (Managed by Terraform)"
  enabled         = true
  trigger_checkin = true
  frequency       = "Ongoing"
  category_id     = var.category_ids["Applications (Managed By Terraform)"]
  scope {
    all_computers = false
    computer_group_ids = [
      var.computer_smart_group_model_ids["Desktops"],
      var.computer_smart_group_model_ids["Laptops"],
    ]
    exclusions {
      computer_group_ids = [jamfpro_smart_computer_group.nudge_is_installed.id]
    }
  }
  payloads {
    packages {
      distribution_point = "default"
      package {
        id     = var.package_ids["nudge-essentials-2.0.12.81807.pkg"]
        action = "Install"
      }
    }
    maintenance {
      recon = true
    }
  }
}
