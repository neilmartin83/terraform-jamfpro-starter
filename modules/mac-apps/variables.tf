# https://learn.jamf.com/en-US/bundle/jamf-pro-documentation-current/page/Apps_Purchased_in_Volume.html

variable "category_ids" {
  description = "Map of category IDs"
  type        = map(string)
}

variable "building_ids" {
  description = "Map of building IDs"
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
