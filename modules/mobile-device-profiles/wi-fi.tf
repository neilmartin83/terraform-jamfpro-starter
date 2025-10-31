locals {
  wifi_ssid     = "Pretend Co Wi-Fi"
  wifi_password = "SuperSecretPassword"
  wifi_mobileconfig_content = templatefile("${path.module}/support-files/wi-fi.mobileconfig.tpl", {
    wifi_ssid     = local.wifi_ssid
    wifi_password = local.wifi_password
  })
}

resource "jamfpro_mobile_device_configuration_profile_plist" "wifi" {
  name               = "Wi-Fi - ${local.wifi_ssid} (Managed by Terraform)"
  level              = "Device Level"
  deployment_method  = "Install Automatically"
  redeploy_on_update = "Newly Assigned"
  payloads           = local.wifi_mobileconfig_content
  payload_validate   = false
  category_id        = var.category_ids["global"]
  scope {
    all_mobile_devices = true
  }
}
