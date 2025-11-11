# https://learn.jamf.com/en-US/bundle/jamf-pro-documentation-current/page/Smart_Groups.html

resource "jamfpro_smart_mobile_device_group" "all_managed" {
  name = "All Managed (Managed by Terraform)"
}
