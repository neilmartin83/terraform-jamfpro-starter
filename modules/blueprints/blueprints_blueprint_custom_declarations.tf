resource "jamfplatform_blueprints_blueprint" "test_custom_declarations" {
  name        = "Terraform Test Custom Declarations"
  description = "Managed by Terraform"
  deployed    = false

  device_groups = concat(
    [data.jamfpro_group.computer_smart_groups["all_managed"].group_platform_id],
    [data.jamfpro_group.mobile_device_smart_groups["all_managed"].group_platform_id]
  )

  custom_declarations = {
    declaration = [
      {
        channel = "SYSTEM"
        kind    = "CONFIGURATION"
        type    = "com.apple.configuration.softwareupdate.settings"
        payload = jsonencode({
          Beta = {
            RequireProgram = {
              Token       = "<beta-token-here>",
              Description = "AppleSeed for IT"
            },
            ProgramEnrollment = "AlwaysOn"
          }
        })
        }, {
        channel = "USER"
        kind    = "ASSET"
        type    = "com.apple.asset.credential.userpassword"
        payload = jsonencode({
          Reference = {
            DataURL     = "https://somewhere.com/something.plist",
            ContentType = "application/plist"
          }
        })
      }
    ]
  }
}
