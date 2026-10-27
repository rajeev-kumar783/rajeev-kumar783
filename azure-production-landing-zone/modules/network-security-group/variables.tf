variable "name" {
  description = "Network security group name."
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

variable "subnet_id" {
  description = "Subnet to associate with this network security group."
  type        = string
}

variable "rules" {
  description = "Ordered security rules to render as dynamic security_rule blocks."
  type = list(object({
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
  default = []
}

variable "tags" {
  description = "Tags applied to the network security group."
  type        = map(string)
  default     = {}
}
