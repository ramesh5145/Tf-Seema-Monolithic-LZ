rgs = {
  RG-SEEMA = {
    name       = "RG-SEEMA"
    location   = "Central India"
    managed_by = "Terraform"
    tags = {
      environment = "dev"
    }
  }
  RG-SIMMI = {
    name       = "RG-SIMMI"
    location   = "Central India"
    managed_by = "Terraform"
    tags = {
      environment = "prod"
    }
  }
}
vnets = {
  VNET-1 = {
    name                = "VNET-1"
    location            = "Central India"
    resource_group_name = "RG-SEEMA"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  FRONTEND_SUBNET = {
    name                 = "FRONTEND_SUBNET"
    resource_group_name  = "RG-SEEMA"
    virtual_network_name = "VNET-1"
    address_prefixes     = ["10.0.1.0/24"]
  }
  BACKEND_SUBNET = {
    name                 = "BACKEND-SUBNET"
    resource_group_name  = "RG-SEEMA"
    virtual_network_name = "VNET-1"
    address_prefixes     = ["10.0.2.0/24"]
  }
}
public_ips = {
  PIP-1 = {
    name                = "APP_GW-PIP"
    resource_group_name = "RG-SEEMA"
    location            = "Central India"
    allocation_method   = "Static"
  }
}
vms = {
  FRONTEND-VM = {
    nic_name             = "FRONTEND-NIC"
    virtual_network_name = "VNET-1"
    subnet_name          = "FRONTEND_SUBNET"
    resource_group_name  = "RG-SEEMA"
    # nic_pip_name         = "FRONTEND-PIP"
    location             = "Central India"
    vm_name              = "FRONTEND-VM"
    vm_size              = "Standard_D2s_v5"
    admin_username       = "Ramesh"
    admin_password       = "Asdf1234g@@1"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
  }
  BACKEND-VM = {
    nic_name             = "BACKEND-NIC"
    virtual_network_name = "VNET-1"
    subnet_name          = "BACKEND-SUBNET"
    resource_group_name  = "RG-SEEMA"
    # nic_pip_name         = "BACKEND-PIP"
    location             = "Central India"
    vm_name              = "BACKEND-VM"
    vm_size              = "Standard_D2s_v5"
    admin_username       = "Ramesh"
    admin_password       = "Asdf1234g@@1"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
  }
}

bas_tion = {
  bastion = {
    sub_name             = "AzureBastionSubnet"
    location             = "Central India"
    resource_group_name  = "RG-SEEMA"
    virtual_network_name = "VNET-1"
    address_prefixes     = ["10.0.5.0/27"]
    bastion_name         = "my-bastion-host"
    bas_name             = "BASTION_PIP"
    allocation_method    = "Static"
    sku                  = "Standard"
  }
}
my_nsg = {
  NSG_FRONT_VM = {
    nsg_name                   = "NSG_FRONTEND_VM"
    location                   = "Central India"
    rg_name                    = "RG-SEEMA"
    rule_name                  = "frontend_rule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  NSG_BACK_VM = {
    nsg_name                   = "NSG_BACKEND_VM"
    location                   = "Central India"
    rg_name                    = "RG-SEEMA"
    rule_name                  = "backend_rule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}


