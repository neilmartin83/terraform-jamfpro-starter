locals {
  models = {
    iphones = {
      name  = "Model - iPhones (Managed by Terraform)"
      model = "iPhone"
    }
    ipads = {
      name  = "Model - iPads (Managed by Terraform)"
      model = "iPad"
    }
  }
}


resource "jamfpro_smart_mobile_device_group" "model" {
  for_each = local.models
  name     = each.value.name
  criteria {
    name        = "Model"
    priority    = 0
    search_type = "like"
    value       = each.value.model
  }
}
