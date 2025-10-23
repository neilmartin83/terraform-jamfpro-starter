terraform {
  required_providers {
    jamfpro = {
      source  = "deploymenttheory/jamfpro"
      version = "0.26.0"
    }
  }
}

resource "jamfpro_policy" "update_jsde" {
  name            = "My Policy"
  enabled         = true
  trigger_checkin = true
  frequency       = "Ongoing"
  category_id     = var.category_ids["Global (Managed By Terraform)"]
  scope {
    all_computers = false
    computer_group_ids = [
      var.smart_group_model_ids["Desktops"]
    ]
  }
  payloads {
    files_processes {
      run_command = "/usr/local/bin/jamf policy -event DoTheThing"
    }
  }
}
