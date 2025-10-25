locals {
  models = {
    "iPhones" = {
      model = "iPhone"
    }
    "iPads" = {
      model = "iPad"
    }
  }
}


resource "jamfpro_smart_mobile_device_group" "model" {
  for_each = local.models
  name     = "All Managed ${each.key} (Managed By Terraform)"
  criteria {
    name        = "Model"
    priority    = 0
    search_type = "like"
    value       = each.value.model
  }
}
