locals {
  os_version_ranges = {
    os_14 = {
      name  = "Operating System - macOS 14 (Managed by Terraform)"
      os_lt = "15.0"
      os_gt = "14.0"
    },
    os_15 = {
      name  = "Operating System - macOS 15 (Managed by Terraform)"
      os_lt = "16.0"
      os_gt = "15.0"
    },
    os_26 = {
      name  = "Operating System - macOS 26 (Managed by Terraform)"
      os_lt = "27.0"
      os_gt = "26.0"
    }
  }
}

resource "jamfpro_smart_computer_group" "os_version" {
  for_each = local.os_version_ranges
  name     = each.value.name
  criteria {
    name        = "Operating System Version"
    priority    = 0
    search_type = "greater than"
    value       = each.value.os_gt

  }
  criteria {
    and_or      = "and"
    name        = "Operating System Version"
    priority    = 1
    search_type = "less than"
    value       = each.value.os_lt
  }
}
