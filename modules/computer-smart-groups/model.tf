locals {
  models = {
    "laptops" = {
      name        = "Model - Laptops (Managed by Terraform)"
      search_type = "like"
      model       = "book"
    }
    "desktops" = {
      name        = "Model - Desktops (Managed by Terraform)"
      search_type = "not like"
      model       = "book"
    }
  }
}

resource "jamfpro_smart_computer_group" "model" {
  for_each = local.models
  name     = each.value.name
  criteria {
    name        = "Model"
    priority    = 0
    search_type = each.value.search_type
    value       = each.value.model
  }
}
