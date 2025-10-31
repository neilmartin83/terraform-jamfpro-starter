data "jamfplatform_cbengine_rules" "cis_lvl1" {
  baseline_id = "cis_lvl1"
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
  target_device_group = data.jamfpro_group.computer_smart_groups["desktops"].group_platform_id
  enforcement_mode    = "MONITOR"
}
