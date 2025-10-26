terraform {
  required_version = ">= 1.10.6"
  required_providers {
    jamfpro = {
      source  = "deploymenttheory/jamfpro"
      version = "0.27.0"
    }
  }
}
