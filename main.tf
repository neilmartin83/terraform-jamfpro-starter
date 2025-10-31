terraform {
  required_version = ">= 1.10.6"
  required_providers {
    jamfplatform = {
      source  = "Jamf-Concepts/jamfplatform"
      version = ">= 0.2.0"
    }
    jamfpro = {
      source  = "deploymenttheory/jamfpro"
      version = "0.27.0"
    }
  }
}

# Global Settings Module
module "settings" {
  source                            = "./modules/settings"
  automated_device_enrollment_token = var.automated_device_enrollment_token
  volume_purchasing_service_token   = var.volume_purchasing_service_token
}

# Computer Modules
module "computer_prestages" {
  count                          = var.automated_device_enrollment_token != null ? 1 : 0
  source                         = "./modules/computer-prestages"
  automated_device_enrollment_id = module.settings.automated_device_enrollment_id
  computer_profile_ids           = module.computer_profiles.profile_ids
  package_ids                    = module.packages.package_ids
}

module "packages" {
  source       = "./modules/packages"
  category_ids = module.settings.category_ids
}

module "computer_smart_groups" {
  source = "./modules/computer-smart-groups"
}

module "computer_profiles" {
  source                   = "./modules/computer-profiles"
  category_ids             = module.settings.category_ids
  computer_smart_group_ids = module.computer_smart_groups.group_ids
}

module "app_installers" {
  source                   = "./modules/app-installers"
  category_ids             = module.settings.category_ids
  computer_smart_group_ids = module.computer_smart_groups.group_ids
}

module "mac_apps" {
  source                          = "./modules/mac-apps"
  category_ids                    = module.settings.category_ids
  building_ids                    = module.settings.building_ids
  volume_purchasing_location_data = local.volume_purchasing_location_data
}

module "policies" {
  source                   = "./modules/policies"
  category_ids             = module.settings.category_ids
  package_ids              = module.packages.package_ids
  computer_smart_group_ids = module.computer_smart_groups.group_ids
}

# Mobile Device Modules
module "mobile_device_prestages" {
  count                          = var.automated_device_enrollment_token != null ? 1 : 0
  source                         = "./modules/mobile-device-prestages"
  automated_device_enrollment_id = module.settings.automated_device_enrollment_id
}

module "mobile_device_smart_groups" {
  source = "./modules/mobile-device-smart-groups"
}

module "mobile_device_profiles" {
  source       = "./modules/mobile-device-profiles"
  category_ids = module.settings.category_ids
}

module "mobile_device_apps" {
  source                          = "./modules/mobile-device-apps"
  category_ids                    = module.settings.category_ids
  department_ids                  = module.settings.department_ids
  volume_purchasing_location_data = local.volume_purchasing_location_data
}

# Blueprints and Compliance Benchmarks Modules 
# Comment out or remove if not using the Jamf Platform API
module "blueprints" {
  source                        = "./modules/blueprints"
  computer_smart_group_ids      = module.computer_smart_groups.group_ids
  mobile_device_smart_group_ids = module.mobile_device_smart_groups.group_ids
}

module "compliance_benchmarks" {
  source                   = "./modules/compliance-benchmarks"
  computer_smart_group_ids = module.computer_smart_groups.group_ids
}
