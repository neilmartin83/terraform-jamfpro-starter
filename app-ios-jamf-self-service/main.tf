terraform {
  required_providers {
    jamfpro = {
      source  = "deploymenttheory/jamfpro"
      version = "0.27.0"
    }
    itunessearchapi = {
      source  = "neilmartin83/itunessearchapi"
      version = ">= 1.6.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.0.0"
    }
  }
}

data "itunessearchapi_content" "apps" {
  ids = [var.jamf_self_service_adam_id]
}

resource "local_file" "icons" {
  for_each = {
    for result in data.itunessearchapi_content.apps.results : result.track_id => result
    if result.artwork_base64 != ""
  }
  content_base64 = each.value.artwork_base64
  filename       = "${path.module}/.icons/${each.value.track_id}/512x512bb.png"
}

resource "jamfpro_icon" "icons" {
  for_each       = local.apps_by_id
  icon_file_path = local_file.icons[each.key].filename
}

resource "jamfpro_mobile_device_application" "jamf_self_service" {
  name                                   = "${local.self_service_app.track_name} (Managed By Terraform)"
  display_name                           = "${local.self_service_app.track_name} - (Managed By Terraform)"
  bundle_id                              = local.self_service_app.bundle_id
  version                                = local.self_service_app.version
  internal_app                           = false
  category_id                            = var.category_ids["Applications (Managed By Terraform)"]
  site_id                                = -1
  itunes_store_url                       = local.self_service_app.track_view_url
  external_url                           = local.self_service_app.track_view_url
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
    self_service_description = local.self_service_app.description
    feature_on_main_page     = false
    notification             = false
    self_service_icon {
      id = jamfpro_icon.icons[var.jamf_self_service_adam_id].id
    }
  }
  vpp {
    assign_vpp_device_based_licenses = local.app_vpp_status["jamf_self_service"].has_licenses
    vpp_admin_account_id             = local.app_vpp_status["jamf_self_service"].vpp_admin_account_id
  }
  app_configuration {
    preferences = file("${path.module}/support-files/AppConfig-JamfSelfService.xml")
  }
  scope {
    all_mobile_devices = true
    all_jss_users      = false
  }
}
