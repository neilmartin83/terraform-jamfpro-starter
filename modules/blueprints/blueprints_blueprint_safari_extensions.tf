resource "jamfplatform_blueprints_blueprint" "test_safari_extensions" {
  name        = "Terraform Test Safari Extensions"
  description = "Managed by Terraform"
  deployed    = false

  device_groups = concat(
    [data.jamfpro_group.computer_smart_groups["all_managed"].group_platform_id],
    [data.jamfpro_group.mobile_device_smart_groups["all_managed"].group_platform_id]
  )

  safari_extensions = {
    managed_extensions = [
      {
        extension_id     = "com.example.adblock"
        state            = "Allowed"
        private_browsing = "AlwaysOff"
        allowed_domains = [
          {
            domain = "*.company.com"
          }
        ]
        denied_domains = [
          {
            domain = "*.social-media.com"
          }
        ]
      }
    ]
  }
}
