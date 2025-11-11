# https://learn.jamf.com/en-US/bundle/jamf-pro-documentation-current/page/Automated_Device_Enrollment_for_Mobile_Devices.html

terraform {
  required_version = ">= 1.10.6"
  required_providers {
    jamfpro = {
      source  = "deploymenttheory/jamfpro"
      version = "0.28.0"
    }
  }
}
