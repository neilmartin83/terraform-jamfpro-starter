locals {
  volume_purchasing_location_data = module.settings_volumepurchasinglocations.volume_purchasing_location_data != null ? module.settings_volumepurchasinglocations.volume_purchasing_location_data : {
    id                                        = ""
    name                                      = ""
    apple_id                                  = ""
    organization_name                         = ""
    token_expiration                          = ""
    country_code                              = ""
    location_name                             = ""
    client_context_mismatch                   = false
    automatically_populate_purchased_content  = false
    send_notification_when_no_longer_assigned = false
    auto_register_managed_users               = false
    site_id                                   = ""
    last_sync_time                            = ""
    total_purchased_licenses                  = 0
    total_used_licenses                       = 0
    content                                   = []
  }
}
