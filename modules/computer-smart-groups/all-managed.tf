# https://learn.jamf.com/en-US/bundle/jamf-pro-documentation-current/page/Smart_Groups.html

resource "jamfpro_smart_computer_group_v2" "all_managed" {
  name = "All Managed (Managed by Terraform)"
}
