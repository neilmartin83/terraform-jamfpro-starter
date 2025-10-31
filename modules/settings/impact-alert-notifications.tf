resource "jamfpro_impact_alert_notification_settings" "default" {
  deployable_objects_alert_enabled             = true
  deployable_objects_confirmation_code_enabled = true
  scopeable_objects_alert_enabled              = true
  scopeable_objects_confirmation_code_enabled  = true
}
