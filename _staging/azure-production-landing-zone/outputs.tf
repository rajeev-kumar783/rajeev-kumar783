output "resource_group_id" {
  description = "Resource ID of the landing-zone resource group."
  value       = azurerm_resource_group.this.id
}

output "virtual_network_ids" {
  description = "Virtual network IDs keyed by the input network keys."
  value       = { for key, network in module.virtual_network : key => network.id }
}

output "subnet_ids" {
  description = "Subnet IDs keyed by virtual network and subnet keys."
  value       = { for key, network in module.virtual_network : key => network.subnet_ids }
}

output "network_security_group_ids" {
  description = "Network security group IDs keyed by the input security group keys."
  value       = { for key, nsg in module.network_security_group : key => nsg.id }
}
