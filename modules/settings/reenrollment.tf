# https://learn.jamf.com/en-US/bundle/jamf-pro-documentation-current/page/Re-enrollment_Settings.html

resource "jamfpro_reenrollment" "default" {
  flush_location_information         = true
  flush_location_information_history = true
  flush_policy_history               = true
  flush_extension_attributes         = true
  flush_software_update_plans        = true
  flush_mdm_queue                    = "DELETE_EVERYTHING"
  depends_on                         = [jamfpro_user_initiated_enrollment_settings.default]
}
