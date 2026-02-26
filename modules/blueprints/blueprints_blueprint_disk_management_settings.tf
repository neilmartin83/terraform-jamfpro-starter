resource "jamfplatform_blueprints_blueprint" "test_disk_management" {
  name        = "Terraform Test Disk Management"
  description = "Managed by Terraform"
  deployed    = false

  device_groups = concat(
    [data.jamfpro_group.computer_smart_groups["all_managed"].group_platform_id],
    [data.jamfpro_group.mobile_device_smart_groups["all_managed"].group_platform_id]
  )

  disk_management_settings = {
    external_storage = "ReadOnly"
    network_storage  = "Disallowed"
  }
}
