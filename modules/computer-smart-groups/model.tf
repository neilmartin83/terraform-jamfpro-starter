locals {
  models = {
    "Laptops" = {
      search_type = "like"
      model       = "book"
    }
    "Desktops" = {
      search_type = "not like"
      model       = "book"
    }
  }
}

resource "jamfpro_smart_computer_group" "model" {
  for_each = local.models
  name     = "Model - ${each.key}"
  criteria {
    name        = "Model"
    priority    = 0
    search_type = each.value.search_type
    value       = each.value.model
  }
}
