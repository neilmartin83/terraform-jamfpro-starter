variable "category_ids" {
  description = "Map of category IDs"
  type        = map(string)
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
