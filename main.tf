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

module "blueprints" {
  source                = "./blueprints"
  smart_group_model_ids = module.common_smart_computer_groups.smart_group_model_ids
}
