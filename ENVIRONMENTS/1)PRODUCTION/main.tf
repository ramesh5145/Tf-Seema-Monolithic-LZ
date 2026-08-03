module "resource_group" {
  source = "../../CHILD MODULES/azurerm_resource_group"
  RGS    = var.rgs
}
module "virtual_network" {
  source     = "../../CHILD MODULES/azurerm_virtual_network"
  VNETS      = var.vnets
  depends_on = [module.resource_group]
}
module "sub_net" {
  source     = "../../CHILD MODULES/azurerm_subnets"
  SUBNETS    = var.subnets
  depends_on = [module.virtual_network]
}
module "virtual_machines" {
  source     = "../../CHILD MODULES/azurerm_nic_virtual_machines"
  VMS        = var.vms
  depends_on = [module.sub_net]
}
module "public_ip" {
  source     = "../../CHILD MODULES/azurerm_public_ip"
  PUBLIC_IPS = var.public_ips
  depends_on = [module.sub_net]
}
module "nsg" {
  source     = "../../CHILD MODULES/azurerm_NSG"
  MY_NSG     = var.my_nsg
  depends_on = [module.sub_net]
}
module "bastion" {
  source     = "../../CHILD MODULES/azurerm_bastion_host"
  BAS_TION   = var.bas_tion
  depends_on = [module.sub_net, module.public_ip]
}
