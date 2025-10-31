locals {
  jamf_self_service_app_store_url = "https://apps.apple.com/gb/app/jamf-self-service/id718509958"
  jamf_self_service_vpp_status = {
    for result in data.itunessearchapi_content.jamf_self_service.results : result.track_id => {
      has_licenses         = contains(local.vpp_adam_ids, tostring(result.track_id))
      vpp_admin_account_id = contains(local.vpp_adam_ids, tostring(result.track_id)) ? var.volume_purchasing_location_data.id : -1
    }
  }
}

data "itunessearchapi_content" "jamf_self_service" {
  app_store_urls = [local.jamf_self_service_app_store_url]
}

resource "jamfpro_icon" "jamf_self_service" {
  for_each = {
    for idx, result in data.itunessearchapi_content.jamf_self_service.results : result.track_id => result
    if result.artwork_url != null
  }
  icon_file_web_source = each.value.artwork_url
}

resource "jamfpro_mobile_device_application" "jamf_self_service" {
  for_each = {
    for idx, result in data.itunessearchapi_content.jamf_self_service.results : result.track_id => result
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
  deploy_automatically                   = true
  deploy_as_managed_app                  = true
  remove_app_when_mdm_profile_is_removed = true
  prevent_backup_of_app_data             = false
  allow_user_to_delete                   = false
  require_network_tethered               = false
  keep_description_and_icon_up_to_date   = false
  keep_app_updated_on_devices            = false
  free                                   = true
  take_over_management                   = true
  host_externally                        = true
  make_available_after_install           = false
  self_service {
    self_service_description = each.value.description
    feature_on_main_page     = false
    notification             = false
    self_service_icon {
      id = jamfpro_icon.jamf_self_service[each.key].id
    }
  }
  vpp {
    assign_vpp_device_based_licenses = local.jamf_self_service_vpp_status[each.key].has_licenses
    vpp_admin_account_id             = local.jamf_self_service_vpp_status[each.key].vpp_admin_account_id
  }
  app_configuration {
    preferences = file("${path.module}/support-files/appconfig-jamf-self-service.xml")
  }
  scope {
    all_mobile_devices = true
    all_jss_users      = false
  }
}
