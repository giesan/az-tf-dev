variable "resource_group_location" {
  type        = string
  default     = "West Europe"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
  default     = "andysExampleRG"
}