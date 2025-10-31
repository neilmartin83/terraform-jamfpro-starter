locals {
  departments = {
    hr          = "HR (Managed by Terraform)",
    engineering = "Engineering (Managed by Terraform)",
    sales       = "Sales (Managed by Terraform)",
    marketing   = "Marketing (Managed by Terraform)",
  }
}

resource "jamfpro_department" "department" {
  for_each = local.departments
  name     = each.value
}
