variable "category_names" {
  description = "List of common Jamf Pro category names to create."
  type        = list(string)
  default = [
    "Global (Managed By Terraform)",
    "Applications (Managed By Terraform)",
    "Scripts (Managed By Terraform)"
  ]
}
