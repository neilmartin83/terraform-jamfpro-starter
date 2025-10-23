terraform {
  required_providers {
    jamfpro = {
      source  = "deploymenttheory/jamfpro"
      version = "0.27.0"
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.7.0"
    }
  }
}

resource "jamfpro_volume_purchasing_locations" "default" {
  count                                     = var.volume_purchasing_service_token != null ? 1 : 0
  name                                      = "Volume Purchasing Location (Managed By Terraform)"
  service_token                             = var.volume_purchasing_service_token
  automatically_populate_purchased_content  = true
  send_notification_when_no_longer_assigned = false
  auto_register_managed_users               = true
  timeouts {
    create = "2m"
  }
}

resource "time_sleep" "wait_2_minutes" {
  depends_on      = [jamfpro_volume_purchasing_locations.default]
  create_duration = "2m"
}

data "jamfpro_volume_purchasing_locations" "default" {
  count      = var.volume_purchasing_service_token != null ? 1 : 0
  id         = jamfpro_volume_purchasing_locations.default[0].id
  depends_on = [time_sleep.wait_2_minutes]
}
