# https://learn.jamf.com/en-US/bundle/jamf-pro-documentation-current/page/Apps_Purchased_in_Volume.html

terraform {
  required_version = ">= 1.10.6"
  required_providers {
    jamfpro = {
      source  = "deploymenttheory/jamfpro"
      version = "0.28.0"
    }
    itunessearchapi = {
      source  = "neilmartin83/itunessearchapi"
      version = ">= 1.6.0"
    }
  }
}

locals {
  vpp_adam_ids = [
    for content in var.volume_purchasing_location_data.content :
    content.adam_id
  ]
}
