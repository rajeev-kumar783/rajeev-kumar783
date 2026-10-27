variable "name" {
  description = "Virtual network name."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the existing resource group."
  type        = string
}

variable "address_space" {
  description = "IPv4 address spaces assigned to the virtual network."
  type        = list(string)
}

variable "subnets" {
  description = "Subnets to create, keyed by stable short names."
  type = map(object({
    name             = string
    address_prefixes = list(string)
  }))
}

variable "tags" {
  description = "Tags applied to the virtual network."
  type        = map(string)
  default     = {}
}
