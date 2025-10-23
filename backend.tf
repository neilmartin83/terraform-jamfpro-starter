terraform {
  cloud {
    organization = "neilmartin83-org"
    workspaces {
      name = "terraform-jamfpro-starter-dev"
    }
  }
}
