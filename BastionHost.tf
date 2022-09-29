resource "azurerm_public_ip" "bastpubip" {
  name                = var.Bastion_PubIp_name
  location            = var.Hub_Bas_location
  resource_group_name = azurerm_resource_group.bastionRG.name
  allocation_method   = var.Bastion_PubIp_allocation_method
  sku                 = var.Bastion_PubIp_sku_name
}

resource "azurerm_bastion_host" "BastionHost" {
  name                = var.Bastion_Host_name
  location            = var.Hub_Bas_location
  resource_group_name = azurerm_resource_group.bastionRG.name

  ip_configuration {
    name                 = var.Bastion_host_ipconfig_name
    subnet_id            = azurerm_subnet.BasSub.id
    public_ip_address_id = azurerm_public_ip.bastpubip.id
  }
}
