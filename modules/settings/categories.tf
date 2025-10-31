locals {
  category_names = {
    global       = "Global (Managed by Terraform)",
    applications = "Applications (Managed by Terraform)",
    scripts      = "Scripts (Managed by Terraform)"
  }
}

resource "jamfpro_category" "common" {
  for_each = local.category_names
  name     = each.value
}
