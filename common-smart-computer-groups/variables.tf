
variable "smart_group_os_ranges" {
  description = "List of common Jamf Pro smart computer group OS version ranges to create."
  type = map(object({
    os_lt = string
    os_gt = string
  }))
  default = {
    "14" = {
      os_lt = "15.0"
      os_gt = "14.0"
    },
    "15" = {
      os_lt = "16.0"
      os_gt = "15.0"
    },
    "26" = {
      os_lt = "27.0"
      os_gt = "26.0"
    }
  }
}

variable "smart_group_architecture_types" {
  description = "List of common Jamf Pro smart computer group architecture types to create."
  type = map(object({
    arch = string
  }))
  default = {
    "Apple Silicon" = {
      arch = "arm64"
    },
    "Intel" = {
      arch = "x86_64"
    }
  }
}

variable "smart_group_models" {
  description = "List of common Jamf Pro smart computer group models to create."
  type = map(object({
    search_type = string
    model       = string
  }))
  default = {
    "Laptops" = {
      search_type = "like"
      model       = "book"
    },
    "Desktops" = {
      search_type = "not like"
      model       = "book"
    },
  }
}
