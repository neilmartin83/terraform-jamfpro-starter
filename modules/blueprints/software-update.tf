# https://learn.jamf.com/en-US/bundle/jamf-pro-blueprints-configuration-guide/page/Jamf_Pro_Blueprints_Configuration_Guide.html

resource "jamfplatform_blueprints_blueprint" "software_update" {
  name        = "Software Updates - Set and Forget - All Managed Computers and Mobile Devices"
  description = "Managed by Terraform"

  device_groups = concat(
    [data.jamfpro_group.computer_smart_groups["all_managed"].group_platform_id],
    [data.jamfpro_group.mobile_device_smart_groups["all_managed"].group_platform_id]
  )

  software_update {
    deployment_time    = "17:30"
    enforce_after_days = 14
  }
}
