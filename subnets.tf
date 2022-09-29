resource "azurerm_subnet" "BasSub" {
  name                 = var.bassubnet
  resource_group_name  = azurerm_resource_group.HubV-netRG.name
  virtual_network_name = azurerm_virtual_network.HubV-Net.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "AppGwSub" {
  name                 = var.AppGtwysubnet
  resource_group_name  = azurerm_resource_group.HubV-netRG.name
  virtual_network_name = azurerm_virtual_network.HubV-Net.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "Gateway" {
  name                 = var.GWsubnet
  resource_group_name  = azurerm_resource_group.HubV-netRG.name
  virtual_network_name = azurerm_virtual_network.HubV-Net.name
  address_prefixes     = ["10.0.3.0/24"]
}  

resource "azurerm_subnet" "AzFirewallSubnet" {
  name                 = var.Firewall_Snet
  resource_group_name  = azurerm_resource_group.HubV-netRG.name
  virtual_network_name = azurerm_virtual_network.HubV-Net.name
  address_prefixes     = ["10.0.5.0/24"]
}

resource "azurerm_subnet" "Spare" {
  name                 = var.sparesnet
  resource_group_name  = azurerm_resource_group.HubV-netRG.name
  virtual_network_name = azurerm_virtual_network.HubV-Net.name
  address_prefixes     = ["10.0.4.0/24"]
}  

resource "azurerm_subnet" "SpkAppSub" {
  name                 = var.SpkAppSnet
  resource_group_name  = azurerm_resource_group.SpokeV-NetRG.name
  virtual_network_name = azurerm_virtual_network.SpkV-Net.name
  address_prefixes     = ["10.1.0.0/24"]
}

resource "azurerm_subnet" "SpkDBSub" {
  name                 = var.SpkDBSnet
  resource_group_name  = azurerm_resource_group.SpokeV-NetRG.name
  virtual_network_name = azurerm_virtual_network.SpkV-Net.name
  address_prefixes     = ["10.1.1.0/24"]
}

resource "azurerm_subnet" "SpokeSpare" {
  name                 = var.SpkSpareSnet
  resource_group_name  = azurerm_resource_group.SpokeV-NetRG.name
  virtual_network_name = azurerm_virtual_network.SpkV-Net.name
  address_prefixes     = ["10.1.2.0/24"]
}
