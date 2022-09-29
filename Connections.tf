resource "azurerm_virtual_network_gateway_connection" "KryptosConnections" {
  name                = var.Kryptos_connections_name
  location            = var.Hub_location
  resource_group_name = azurerm_resource_group.HubV-netRG.name

  type                       = var.Kryptos_connections_type
  virtual_network_gateway_id = azurerm_virtual_network_gateway.VrtlNtwkGW.id
  local_network_gateway_id   = azurerm_local_network_gateway.KryptosLNG.id

  shared_key = var.KryptosConnections_shared_key
}
