resource "azurerm_virtual_network" "VNETS" {
  for_each            = var.VNETS
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
}