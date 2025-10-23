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

data "jamfpro_group" "smart_group_models" {
  for_each         = var.smart_group_model_ids
  group_jamfpro_id = each.value
  group_type       = "COMPUTER"
}

data "jamfplatform_cbengine_rules" "cis_lvl1" {
  baseline_id = "cis_lvl1"
}

data "jamfplatform_cbengine_rules" "cis_lvl2" {
  baseline_id = "cis_lvl2"
}

resource "jamfplatform_cbengine_benchmark" "cis_lvl1_all" {
  title              = "CIS Level 1 - Desktops"
  description        = "Managed by Terraform"
  source_baseline_id = "cis_lvl1"
  sources = [
    for s in data.jamfplatform_cbengine_rules.cis_lvl1.sources : {
      branch   = s.branch
      revision = s.revision
    }
  ]
  rules = [
    for r in data.jamfplatform_cbengine_rules.cis_lvl1.rules : {
      id      = r.id
      enabled = r.enabled
    }
  ]
  target_device_group = data.jamfpro_group.smart_group_models["Desktops"].group_platform_id
  enforcement_mode    = "MONITOR"
}

resource "jamfplatform_cbengine_benchmark" "cis_lvl2_all" {
  title              = "CIS Level 2 - Laptops"
  description        = "Managed by Terraform"
  source_baseline_id = "cis_lvl2"
  sources = [
    for s in data.jamfplatform_cbengine_rules.cis_lvl2.sources : {
      branch   = s.branch
      revision = s.revision
    }
  ]
  rules = [
    for r in data.jamfplatform_cbengine_rules.cis_lvl2.rules : {
      id      = r.id
      enabled = r.enabled
    }
  ]
  target_device_group = data.jamfpro_group.smart_group_models["Laptops"].group_platform_id
  enforcement_mode    = "MONITOR"
}
