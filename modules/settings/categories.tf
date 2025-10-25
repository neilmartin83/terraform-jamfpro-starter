locals {
  category_names = [
    "Global (Managed By Terraform)",
    "Applications (Managed By Terraform)",
    "Scripts (Managed By Terraform)"
  ]
}

resource "jamfpro_category" "common" {
  for_each = toset(local.category_names)
  name     = each.key
}
