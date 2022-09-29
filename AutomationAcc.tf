resource "azurerm_automation_account" "AutomationAcc" {
  name                = var.automation_account_name
  location            = var.HubManagement_location
  resource_group_name = azurerm_resource_group.HubManagementRG.name
  sku_name            = var.automation_acc_sku_name
  
  tags = {
    environment = var.automation_acc_tag_env_name
  }
}
