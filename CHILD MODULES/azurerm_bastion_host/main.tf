
resource "azurerm_subnet" "bastion_subnet" {
  for_each             = var.BAS_TION
  name                 = each.value.sub_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}
resource "azurerm_public_ip" "BASTION_PIP" {
  for_each = var.BAS_TION
  name                = each.value.bas_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
}

resource "azurerm_bastion_host" "BASTION" {
  for_each            = var.BAS_TION
  name                = each.value.bastion_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name                 = "BHONDU"
    subnet_id            = azurerm_subnet.bastion_subnet[each.key].id
    public_ip_address_id = azurerm_public_ip.BASTION_PIP[each.key].id
  }
}