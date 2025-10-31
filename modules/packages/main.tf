terraform {
  required_version = ">= 1.10.6"
  required_providers {
    jamfpro = {
      source  = "deploymenttheory/jamfpro"
      version = "0.27.0"
    }
  }
}

locals {
  package_names = {
    microsoft_company_portal = "microsoft-company-portal-5.2508.1.pkg"
    nudge                    = "nudge-essentials-2.0.12.81807.pkg"
  }
}

resource "jamfpro_package" "default" {
  for_each              = local.package_names
  package_name          = each.value
  package_file_source   = "${path.module}/support-files/${each.value}"
  category_id           = var.category_ids["applications"]
  info                  = "Managed by Terraform"
  priority              = 10
  reboot_required       = false
  fill_user_template    = false
  os_install            = false
  suppress_updates      = false
  suppress_from_dock    = false
  suppress_eula         = false
  suppress_registration = false
}
