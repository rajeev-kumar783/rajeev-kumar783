variable "subscription_id" {
  description = "Azure subscription used for this deployment."
  type        = string
}

variable "location" {
  description = "Azure region for the example resources."
  type        = string
  default     = "westeurope"
}

variable "resource_group_name" {
  description = "Resource group for the example landing-zone network."
  type        = string
  default     = "rg-platform-network-dev"
}

variable "networks" {
  description = "Virtual networks and their subnets, keyed by stable short names."
  type = map(object({
    name          = string
    address_space = list(string)
    subnets = map(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}

variable "security_groups" {
  description = "Network security groups and the subnet each group is associated with."
  type = map(object({
    name        = string
    network_key = string
    subnet_key  = string
    rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = optional(string, "*")
      destination_port_range     = optional(string, "*")
      source_address_prefix      = optional(string, "*")
      destination_address_prefix = optional(string, "*")
      description                = optional(string)
    }))
  }))
  default = {}
}

variable "tags" {
  description = "Tags applied to all resources managed by this example."
  type        = map(string)
  default     = {}
}
