locals {
  architecture_types = {
    apple_silicon = {
      name = "Architecture - Apple Silicon (Managed by Terraform)"
      arch = "arm64"
    },
    intel = {
      name = "Architecture - Intel (Managed by Terraform)"
      arch = "x86_64"
    }
  }
}

resource "jamfpro_smart_computer_group" "architecture" {
  for_each = local.architecture_types
  name     = each.value.name
  criteria {
    name        = "Architecture Type"
    priority    = 0
    search_type = "is"
    value       = each.value.arch
  }
}
