resource "azurerm_route_table" "SpkV-NetRT" {
  name                = var.Spoke_Vnet_RT
  location            = var.Spoke_location
  resource_group_name = azurerm_resource_group.SpokeV-NetRG.name

  route {
    name                   = var.Route_Configuration_name
    address_prefix         = var.Address_prefix_range
    next_hop_type          = var.Appliance_type_name
    next_hop_in_ip_address = var.Appliance_type_ip_address
  }
}

resource "azurerm_subnet_route_table_association" "SubAssocRT" {
  subnet_id      = azurerm_subnet.SpokeSpare.id
  route_table_id = azurerm_route_table.SpkV-NetRT.id
}
