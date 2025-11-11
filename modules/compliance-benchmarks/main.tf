# https://learn.jamf.com/en-US/bundle/jamf-compliance-benchmarks-configuration-guide/page/Compliance_Benchmarks_Configuration_Guide.html

terraform {
  required_version = ">= 1.10.6"
  required_providers {
    jamfplatform = {
      source  = "Jamf-Concepts/jamfplatform"
      version = ">= 0.2.0"
    }
    jamfpro = {
      source  = "deploymenttheory/jamfpro"
      version = "0.28.0"
    }
  }
}

data "jamfpro_group" "computer_smart_groups" {
  for_each         = var.computer_smart_group_ids
  group_jamfpro_id = each.value
  group_type       = "COMPUTER"
}
