resource "azurerm_public_ip" "VpnPubip" {
    name                = var.Vpn_pubIp_name
    location            = var.Hub_location
    resource_group_name = azurerm_resource_group.HubV-netRG.name
  
    allocation_method = var.Vpn_ip_allocation_method
  }

resource "azurerm_virtual_network_gateway" "VrtlNtwkGW" {
    name                = var.Virtual_Network_Gw_name
    location            = var.Hub_location
    resource_group_name = azurerm_resource_group.HubV-netRG.name
  
    type     = var.Virtual_ntwrk_gw_type
    vpn_type = var.Virtual_ntwrk_gw_vpn_type
  
    active_active = var.Virtual_ntwrk_gw_vpn_active_active
    enable_bgp    = var.Virtual_ntwrk_gw_vpn_bgp_enable_configuration
    sku           = var.Virtual_ntwrk_gw_vpn_sku_configuration
  
    ip_configuration {
      name                          = var.Vnet_Gw_ip_Config
      public_ip_address_id          = azurerm_public_ip.VpnPubip.id
      private_ip_address_allocation = var.Vpn_priv_ip_address_allocation
      subnet_id                     = azurerm_subnet.Gateway.id
    }
  }
