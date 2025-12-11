# https://learn.jamf.com/en-US/bundle/jamf-pro-documentation-current/page/Volume_Purchasing_Integration.html

resource "jamfpro_volume_purchasing_locations" "default" {
  count                                     = var.volume_purchasing_service_token != null ? 1 : 0
  name                                      = "Volume Purchasing Location (Managed by Terraform)"
  service_token                             = trimspace(var.volume_purchasing_service_token)
  automatically_populate_purchased_content  = true
  send_notification_when_no_longer_assigned = false
  auto_register_managed_users               = true
  timeouts {
    create = "2m"
  }
}

resource "time_sleep" "wait_2_minutes" {
  count           = var.volume_purchasing_service_token != null ? 1 : 0
  create_duration = "2m"
  triggers = {
    vpp_location_id = one(jamfpro_volume_purchasing_locations.default[*].id)
  }
}

data "jamfpro_volume_purchasing_locations" "default" {
  count = var.volume_purchasing_service_token != null ? 1 : 0
  id    = one(jamfpro_volume_purchasing_locations.default[*].id)
  lifecycle {
    postcondition {
      condition     = one(time_sleep.wait_2_minutes[*].id) != null
      error_message = "Volume purchasing location sync did not complete."
    }
  }
}
