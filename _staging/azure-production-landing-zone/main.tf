resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "virtual_network" {
  source   = "./modules/virtual-network"
  for_each = var.networks

  name                = each.value.name
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  address_space       = each.value.address_space
  subnets             = each.value.subnets
  tags                = var.tags
}

module "network_security_group" {
  source   = "./modules/network-security-group"
  for_each = var.security_groups

  name                = each.value.name
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  subnet_id           = module.virtual_network[each.value.network_key].subnet_ids[each.value.subnet_key]
  rules               = each.value.rules
  tags                = var.tags
}
