# https://learn.jamf.com/en-US/bundle/jamf-pro-documentation-current/page/Buildings_and_Departments.html

locals {
  buildings = {
    north = "North Wing (Managed by Terraform)",
    south = "South Wing (Managed by Terraform)",
    east  = "East Wing (Managed by Terraform)",
    west  = "West Wing (Managed by Terraform)",
  }
}

resource "jamfpro_building" "common" {
  for_each = local.buildings
  name     = each.value
}
