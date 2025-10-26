locals {
  architecture_types = {
    "Apple Silicon" = {
      arch = "arm64"
    },
    "Intel" = {
      arch = "x86_64"
    }
  }
}

resource "jamfpro_smart_computer_group" "architecture" {
  for_each = local.architecture_types
  name     = "Architecture - ${each.key}"
  criteria {
    name        = "Architecture Type"
    priority    = 0
    search_type = "is"
    value       = each.value.arch
  }
}
