locals {
  microsoft_office_app_store_urls = {
    excel      = "https://apps.apple.com/gb/app/microsoft-excel/id586683407",
    powerpoint = "https://apps.apple.com/gb/app/microsoft-powerpoint/id586449534",
    word       = "https://apps.apple.com/gb/app/microsoft-word/id586447913",
    outlook    = "https://apps.apple.com/gb/app/microsoft-outlook/id951937596",
    teams      = "https://apps.apple.com/gb/app/microsoft-teams/id1113153706"
  }
  microsoft_office_vpp_status = {
    for result in data.itunessearchapi_content.microsoft_office_apps.results : result.track_id => {
      has_licenses         = contains(local.vpp_adam_ids, tostring(result.track_id))
      vpp_admin_account_id = contains(local.vpp_adam_ids, tostring(result.track_id)) ? var.volume_purchasing_location_data.id : -1
    }
  }
}

data "itunessearchapi_content" "microsoft_office_apps" {
  app_store_urls = values(local.microsoft_office_app_store_urls)
}

resource "jamfpro_icon" "microsoft_office" {
  for_each = {
    for idx, result in data.itunessearchapi_content.microsoft_office_apps.results : result.track_id => result
    if result.artwork_url != null
  }
  icon_file_web_source = each.value.artwork_url
}

resource "jamfpro_mobile_device_application" "microsoft_office" {
  for_each = {
    for idx, result in data.itunessearchapi_content.microsoft_office_apps.results : result.track_id => result
    if result.track_name != null
  }
  name                                   = "${each.value.track_name} (Managed by Terraform)"
  display_name                           = "${each.value.track_name} (Managed by Terraform)"
  bundle_id                              = each.value.bundle_id
  version                                = each.value.version
  internal_app                           = false
  category_id                            = var.category_ids["applications"]
  site_id                                = -1
  itunes_store_url                       = each.value.track_view_url
  external_url                           = each.value.track_view_url
  itunes_country_region                  = "US"
  itunes_sync_time                       = 0
  deploy_automatically                   = false
  deploy_as_managed_app                  = true
  remove_app_when_mdm_profile_is_removed = false
  prevent_backup_of_app_data             = false
  allow_user_to_delete                   = true
  require_network_tethered               = false
  keep_description_and_icon_up_to_date   = false
  keep_app_updated_on_devices            = false
  free                                   = true
  take_over_management                   = true
  host_externally                        = true
  make_available_after_install           = true
  self_service {
    self_service_description = each.value.description
    feature_on_main_page     = true
    notification             = false
    self_service_icon {
      id = jamfpro_icon.microsoft_office[each.key].id
    }
  }
  vpp {
    assign_vpp_device_based_licenses = local.microsoft_office_vpp_status[each.key].has_licenses
    vpp_admin_account_id             = local.microsoft_office_vpp_status[each.key].vpp_admin_account_id
  }
  scope {
    all_mobile_devices = true
    all_jss_users      = false
  }
}
