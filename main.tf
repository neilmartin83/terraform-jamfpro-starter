terraform {
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

module "common_settings" {
  source = "./common-settings"
}

module "common_categories" {
  source = "./common-categories"
}

module "common_smart_computer_groups" {
  source = "./common-smart-computer-groups"
}

module "common_policies" {
  source                = "./common-policies"
  category_ids          = module.common_categories.jamfpro_category_ids
  smart_group_model_ids = module.common_smart_computer_groups.smart_group_model_ids
}

module "compliance_benchmarks" {
  source                = "./compliance-benchmarks"
  smart_group_model_ids = module.common_smart_computer_groups.smart_group_model_ids
}

module "blueprints" {
  source                = "./blueprints"
  smart_group_model_ids = module.common_smart_computer_groups.smart_group_model_ids
}

module "app_macos_microsoft_company_portal" {
  source                = "./app-macos-microsoft-company-portal"
  category_ids          = module.common_categories.jamfpro_category_ids
  smart_group_model_ids = module.common_smart_computer_groups.smart_group_model_ids
}

module "settings_volumepurchasinglocations" {
  source                          = "./settings-volume-purchasing-locations"
  volume_purchasing_service_token = var.volume_purchasing_service_token
}

module "app_ios_jamf_self_service" {
  source                          = "./app-ios-jamf-self-service"
  category_ids                    = module.common_categories.jamfpro_category_ids
  volume_purchasing_location_data = local.volume_purchasing_location_data
}
