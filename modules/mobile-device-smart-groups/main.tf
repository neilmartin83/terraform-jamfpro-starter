# https://learn.jamf.com/en-US/bundle/jamf-pro-documentation-current/page/Smart_Groups.html

terraform {
  required_version = ">= 1.10.6"
  required_providers {
    jamfpro = {
      source  = "deploymenttheory/jamfpro"
      version = "0.28.0"
    }
  }
}
