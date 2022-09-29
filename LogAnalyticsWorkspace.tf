resource "azurerm_log_analytics_workspace" "LogAnalyticsWrkspce" {
  name                = var.Log_Analytics_Workspace_name
  location            = var.HubManagement_location
  resource_group_name = azurerm_resource_group.HubManagementRG.name
  sku                 = var.log_analytics_sku_name
  retention_in_days   = var.log_analytics_retention_in_days
}
