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
  category_id     = var.category_ids["applications"]
  scope {
    all_computers = false
    computer_group_ids = [
      var.computer_smart_group_ids["laptops"]
    ]
    exclusions {
      computer_group_ids = [jamfpro_smart_computer_group.nudge_is_installed.id]
    }
  }
  payloads {
    packages {
      distribution_point = "default"
      package {
        id     = var.package_ids["nudge"]
        action = "Install"
      }
    }
    maintenance {
      recon = true
    }
  }
}
