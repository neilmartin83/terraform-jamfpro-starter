# https://learn.jamf.com/en-US/bundle/jamf-pro-documentation-current/page/Policies.html

terraform {
  required_version = ">= 1.11.1"
  required_providers {
    jamfpro = {
      source  = "deploymenttheory/jamfpro"
      version = "0.30.0"
    }
  }
}
