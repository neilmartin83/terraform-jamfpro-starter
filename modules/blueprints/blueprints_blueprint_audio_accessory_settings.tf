resource "jamfplatform_blueprints_blueprint" "test_audio_accessory_settings" {
  name        = "Terraform Test Audio Accessory Settings"
  description = "Managed by Terraform"
  deployed    = false

  device_groups = concat(
    [data.jamfpro_group.computer_smart_groups["all_managed"].group_platform_id],
    [data.jamfpro_group.mobile_device_smart_groups["all_managed"].group_platform_id]
  )

  audio_accessory_settings = {
    temporary_pairing_disabled = false
    unpairing_time_policy      = "Hour"
    unpairing_time_hour        = 22
  }
}
