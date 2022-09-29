resource "azurerm_public_ip" "AppGwPubIp" {
  name                = var.AppGw_pubIp_name
  resource_group_name = azurerm_resource_group.HubV-netRG.name
  location            = var.Hub_location
  allocation_method   = var.AppGw_pubIp_allocation_method
  sku                 = var.AppGw_PubIp_sku
}

#&nbsp;since these variables are re-used - a locals block makes this more maintainable
locals {
  backend_address_pool_name      = "${azurerm_virtual_network.HubV-Net.name}-beap"
  frontend_port_name             = "${azurerm_virtual_network.HubV-Net.name}-feport"
  frontend_ip_configuration_name = "${azurerm_virtual_network.HubV-Net.name}-feip"
  http_setting_name              = "${azurerm_virtual_network.HubV-Net.name}-be-htst"
  listener_name                  = "${azurerm_virtual_network.HubV-Net.name}-httplstn"
  request_routing_rule_name      = "${azurerm_virtual_network.HubV-Net.name}-rqrt"
  redirect_configuration_name    = "${azurerm_virtual_network.HubV-Net.name}-rdrcfg"
}

resource "azurerm_application_gateway" "AppGw" {
  name                = var.App_Gw_name
  resource_group_name = azurerm_resource_group.HubV-netRG.name
  location            = var.Hub_location

  sku {
    name     = var.AppGw_sku_name
    tier     = var.AppGw_sku_tier
    capacity = var.AppGw_sku_capacity
  }

  gateway_ip_configuration {
    name      = var.AppGw_gateway_ip_configuration_name
    subnet_id = azurerm_subnet.AppGwSub.id
  }

  frontend_port {
    name = var.AppGw_frontend_port_name
    port = var.AppGw_frontend_port_port
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.AppGwPubIp.id
  }

  backend_address_pool {
    name = local.backend_address_pool_name
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = var.AppGw_backend_http_settings_cookie_based_affinity
    path                  = var.AppGw_backend_http_settings_path
    port                  = var.AppGw_backend_http_settings_port
    protocol              = var.AppGw_backend_http_settings_protocol
    request_timeout       = var.AppGw_backend_http_settings_request_timeout
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = var.AppGw_frontend_port_name
    protocol                       = var.AppGw_http_listener_protocol
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    rule_type                  = var.AppGw_request_routing_rule_rule_type
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
    priority                   = var.AppGw_request_routing_rule_priority
  }
}
