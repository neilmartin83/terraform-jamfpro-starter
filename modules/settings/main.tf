terraform {
  required_version = ">= 1.10.6"
  required_providers {
    jamfpro = {
      source  = "deploymenttheory/jamfpro"
      version = "0.28.0"
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.13.1"
    }
  }
}
