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
