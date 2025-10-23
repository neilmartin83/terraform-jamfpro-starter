terraform {
  required_providers {
    jamfpro = {
      source  = "deploymenttheory/jamfpro"
      version = "0.27.0"
    }
  }
}

resource "jamfpro_self_service_plus_settings" "default" {
  enabled = true
}

resource "jamfpro_client_checkin" "default" {
  check_in_frequency                  = 15
  create_startup_script               = true
  startup_log                         = true
  startup_ssh                         = false
  startup_policies                    = true
  create_hooks                        = true
  hook_log                            = true
  hook_policies                       = true
  enable_local_configuration_profiles = false
  allow_network_state_change_triggers = false
}

resource "jamfpro_computer_inventory_collection_settings" "default" {
  computer_inventory_collection_preferences {
    monitor_application_usage                          = false
    include_packages                                   = true
    include_software_updates                           = false
    include_software_id                                = true
    include_accounts                                   = true
    calculate_sizes                                    = false
    include_hidden_accounts                            = false
    include_printers                                   = true
    include_services                                   = true
    collect_synced_mobile_device_info                  = false
    update_ldap_info_on_computer_inventory_submissions = true
    monitor_beacons                                    = false
    allow_changing_user_and_location                   = true
    use_unix_user_paths                                = true
    collect_unmanaged_certificates                     = true
  }
}

resource "jamfpro_local_admin_password_settings" "default" {
  auto_deploy_enabled            = true
  password_rotation_time_seconds = 86400
}

resource "jamfpro_managed_software_update_feature_toggle" "default" {
  toggle = true
}

resource "jamfpro_user_initiated_enrollment_settings" "default" {
  restrict_reenrollment_to_authorized_users_only  = false
  skip_certificate_installation_during_enrollment = true
  user_initiated_enrollment_for_computers {
    enable_user_initiated_enrollment_for_computers = true
    ensure_ssh_is_enabled                          = false
    launch_self_service_when_done                  = true
    account_driven_device_enrollment               = false
    managed_local_administrator_account {
      create_managed_local_administrator_account                    = true
      management_account_username                                   = "lapsadmin"
      hide_managed_local_administrator_account                      = true
      allow_ssh_access_for_managed_local_administrator_account_only = false
    }
  }
  user_initiated_enrollment_for_devices {
    profile_driven_enrollment_via_url {
      enable_for_institutionally_owned_devices = true
      enable_for_personally_owned_devices      = false
    }
  }
  messaging {
    language_code                                   = "en"
    language_name                                   = "English"
    page_title                                      = "Enroll Your Device"
    username_text                                   = "Username"
    password_text                                   = "Password"
    login_button_text                               = "Log In"
    personal_device_button_name                     = "Personally Owned"
    institutional_ownership_button_name             = "Institutionally Owned"
    enroll_device_button_name                       = "Continue"
    accept_button_text                              = "Accept"
    ca_certificate_name                             = "CA Certificate"
    ca_certificate_install_button_name              = "Continue"
    institutional_mdm_profile_name                  = "MDM Profile"
    institutional_mdm_profile_install_button_name   = "Install"
    personal_mdm_profile_name                       = "MDM Profile"
    personal_mdm_profile_install_button_name        = "Enroll"
    user_enrollment_mdm_profile_name                = "MDM Profile"
    user_enrollment_mdm_profile_install_button_name = "Continue"
    quickadd_package_name                           = "QuickAdd.pkg"
    quickadd_package_install_button_name            = "Download"
    log_out_button_name                             = "Log Out"
  }
  lifecycle {
    ignore_changes = [
      messaging,
      user_initiated_enrollment_for_devices
    ]
  }
}

resource "jamfpro_reenrollment" "default" {
  flush_location_information         = true
  flush_location_information_history = true
  flush_policy_history               = true
  flush_extension_attributes         = true
  flush_software_update_plans        = true
  flush_mdm_queue                    = "DELETE_EVERYTHING"
  depends_on                         = [jamfpro_user_initiated_enrollment_settings.default]
}
