locals {
  apps_by_id = {
    for result in data.itunessearchapi_content.apps.results : result.track_id => result
  }
  self_service_app = local.apps_by_id[var.jamf_self_service_adam_id]
  vpp_adam_ids = var.volume_purchasing_location_data != null ? [
    for content in var.volume_purchasing_location_data.content :
    content.adam_id
  ] : []
  app_vpp_status = {
    "jamf_self_service" = {
      has_licenses         = var.volume_purchasing_location_data != null ? contains(local.vpp_adam_ids, var.jamf_self_service_adam_id) : false
      vpp_admin_account_id = var.volume_purchasing_location_data != null && contains(local.vpp_adam_ids, var.jamf_self_service_adam_id) ? var.volume_purchasing_location_data.id : -1
    }
  }
}
