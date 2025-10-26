terraform {
  required_version = ">= 1.10.6"
  required_providers {
    jamfpro = {
      source  = "deploymenttheory/jamfpro"
      version = "0.27.0"
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.13.1"
    }
  }
}
