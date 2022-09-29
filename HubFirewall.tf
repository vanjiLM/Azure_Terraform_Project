resource "azurerm_public_ip" "FirePubIp" {
  name                = var.Firewall_PubIp_name
  location            = var.Hub_location
  resource_group_name = azurerm_resource_group.HubV-netRG.name
  allocation_method   = var.firewall_pubip_allocation_method
  sku                 = var.firewall_pubip_sku_name
}

resource "azurerm_firewall" "MyHubFirewall" {
  name                = var.Hub_Firewall_name
  location            = var.Hub_location
  resource_group_name = azurerm_resource_group.HubV-netRG.name
  sku_name            = var.firewall_sku_name
  sku_tier            = var.firewall_sku_tier
  
  ip_configuration {
    name                 = "FirewallConfiguration"
    subnet_id            = azurerm_subnet.AzFirewallSubnet.id
    public_ip_address_id = azurerm_public_ip.FirePubIp.id
  }
}
