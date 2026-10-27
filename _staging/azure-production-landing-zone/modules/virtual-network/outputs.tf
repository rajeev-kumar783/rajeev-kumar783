output "id" {
  description = "Virtual network resource ID."
  value       = azurerm_virtual_network.this.id
}

output "subnet_ids" {
  description = "Subnet IDs keyed by the input subnet keys."
  value       = { for key, subnet in azurerm_subnet.this : key => subnet.id }
}
