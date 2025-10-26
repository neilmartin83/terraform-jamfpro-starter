terraform {
  required_version = ">= 1.10.6"
  required_providers {
    jamfpro = {
      source  = "deploymenttheory/jamfpro"
      version = "0.27.0"
    }
    itunessearchapi = {
      source  = "neilmartin83/itunessearchapi"
      version = ">= 1.6.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.0.0"
    }
  }
}

locals {
  vpp_adam_ids = [
    for content in var.volume_purchasing_location_data.content :
    content.adam_id
  ]
}
