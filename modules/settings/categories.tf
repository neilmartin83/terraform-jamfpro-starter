locals {
  category_names = [
    "Global (Managed by Terraform)",
    "Applications (Managed by Terraform)",
    "Scripts (Managed by Terraform)"
  ]
}

resource "jamfpro_category" "common" {
  for_each = toset(local.category_names)
  name     = each.key
}
