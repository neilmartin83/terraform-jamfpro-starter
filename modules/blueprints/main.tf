terraform {
  required_version = ">= 1.10.6"
  required_providers {
    jamfplatform = {
      source  = "Jamf-Concepts/jamfplatform"
      version = ">= 0.2.0"
    }
    jamfpro = {
      source  = "deploymenttheory/jamfpro"
      version = "0.27.0"
    }
  }
}

data "jamfpro_group" "computer_smart_groups" {
  for_each         = var.computer_smart_group_ids
  group_jamfpro_id = each.value
  group_type       = "COMPUTER"
}

data "jamfpro_group" "mobile_device_smart_groups" {
  for_each         = var.mobile_device_smart_group_ids
  group_jamfpro_id = each.value
  group_type       = "MOBILE"
}
