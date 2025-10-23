terraform {
  required_providers {
    jamfpro = {
      source  = "deploymenttheory/jamfpro"
      version = "0.27.0"
    }
  }
}

resource "jamfpro_smart_computer_group" "os_version" {
  for_each = var.smart_group_os_ranges
  name     = "Operating System - macOS ${each.key}"
  criteria {
    name        = "Operating System Version"
    priority    = 0
    search_type = "greater than"
    value       = each.value.os_gt

  }
  criteria {
    and_or      = "and"
    name        = "Operating System Version"
    priority    = 1
    search_type = "less than"
    value       = each.value.os_lt
  }
}

resource "jamfpro_smart_computer_group" "architecture_type" {
  for_each = var.smart_group_architecture_types
  name     = "Architecture Type - ${each.key}"
  criteria {
    name        = "Architecture Type"
    priority    = 0
    search_type = "is"
    value       = each.value.arch
  }
}

resource "jamfpro_smart_computer_group" "model" {
  for_each = var.smart_group_models
  name     = "Model - ${each.key}"
  criteria {
    name        = "Model"
    priority    = 0
    search_type = each.value.search_type
    value       = each.value.model
  }
}
