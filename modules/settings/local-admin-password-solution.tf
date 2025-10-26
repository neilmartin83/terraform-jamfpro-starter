resource "jamfpro_local_admin_password_settings" "default" {
  auto_deploy_enabled            = true
  password_rotation_time_seconds = 86400
}
