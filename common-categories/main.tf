terraform {
  required_providers {
    jamfpro = {
      source  = "deploymenttheory/jamfpro"
      version = "0.26.0"
    }
  }
}
resource "jamfpro_category" "common" {
  for_each = toset(var.category_names)
  name     = each.key
}
