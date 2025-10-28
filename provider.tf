# jamfpro provider configuration
provider "jamfpro" {
  jamfpro_instance_fqdn               = var.jamfpro_instance_fqdn
  auth_method                         = "oauth2"
  client_id                           = var.jamfpro_client_id
  client_secret                       = var.jamfpro_client_secret
  token_refresh_buffer_period_seconds = 50
}

# jamfplatform provider configuration
# Comment out or remove this block if you do not wish to use the Jamf Platform provider
# Also comment out or remove the 'blueprints' and 'compliance_benchmarks' modules in main.tf
provider "jamfplatform" {
  base_url      = var.jamfplatform_base_url
  client_id     = var.jamfplatform_client_id
  client_secret = var.jamfplatform_client_secret
}
