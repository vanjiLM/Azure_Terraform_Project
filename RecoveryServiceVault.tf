resource "azurerm_recovery_services_vault" "RcvryVlt" {
  name                = var.recovery_services_vault_name
  location            = var.HubIdentity_location
  resource_group_name = azurerm_resource_group.HubIDMRG.name
  sku                 = var.Recovery_service_vault_sku_name

  soft_delete_enabled = var.Recovery_service_vault_soft_enabledelete
}
