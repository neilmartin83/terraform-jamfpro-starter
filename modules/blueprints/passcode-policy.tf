resource "jamfplatform_blueprints_blueprint" "passcode_policy" {
  name        = "Passcode Policy"
  description = "Managed by Terraform"

  device_groups = [data.jamfpro_group.mobile_device_smart_groups["iphones"].group_platform_id]

  passcode_policy {
    change_at_next_auth              = true
    failed_attempts_reset_in_minutes = 0
    maximum_failed_attempts          = 11
    maximum_grace_period_in_minutes  = 0
    maximum_inactivity_in_minutes    = 0
    maximum_passcode_age_in_days     = 0
    minimum_complex_characters       = 0
    minimum_length                   = 0
    passcode_reuse_limit             = 1
    require_alphanumeric_passcode    = true
    require_complex_passcode         = true
    require_passcode                 = true
  }
}
