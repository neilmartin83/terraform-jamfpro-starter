output "profile_ids" {
  description = "The IDs of the Jamf Pro computer profiles created."
  value = {
    "sso_extension_entra_id"        = jamfpro_macos_configuration_profile_plist.sso_extension_entra_id.id,
    "security_and_privacy_laptops"  = jamfpro_macos_configuration_profile_plist.security_and_privacy_laptops.id,
    "security_and_privacy_desktops" = jamfpro_macos_configuration_profile_plist.security_and_privacy_desktops.id,
    "nudge"                         = jamfpro_macos_configuration_profile_plist.nudge.id,
    "microsoft_autoupdate"          = jamfpro_macos_configuration_profile_plist.microsoft_autoupdate.id,
  }
}
