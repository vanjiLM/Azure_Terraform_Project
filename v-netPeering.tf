resource "azurerm_virtual_network_peering" "hbtospk" {
  name                      = var.Hub_Spoke_Peering_name
  resource_group_name       = azurerm_resource_group.HubV-netRG.name
  virtual_network_name      = azurerm_virtual_network.HubV-Net.name
  remote_virtual_network_id = azurerm_virtual_network.SpkV-Net.id
}

resource "azurerm_virtual_network_peering" "spktohb" {
  name                      = var.Spoke_Hub_Peering_name
  resource_group_name       = azurerm_resource_group.SpokeV-NetRG.name
  virtual_network_name      = azurerm_virtual_network.SpkV-Net.name
  remote_virtual_network_id = azurerm_virtual_network.HubV-Net.id
}
