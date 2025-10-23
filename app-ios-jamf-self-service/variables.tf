variable "category_ids" {
  description = "Map of category IDs"
  type        = map(string)
}

variable "jamf_self_service_adam_id" {
  type        = string
  description = "Jamf Self Service ADAM ID"
  default     = "718509958"
}

variable "volume_purchasing_location_data" {
  description = "Volume Purchasing Location data from VPP locations module"
  type = object({
    id = string
    content = list(object({
      adam_id = string
    }))
  })
  default = null
}
