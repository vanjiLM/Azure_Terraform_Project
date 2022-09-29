data "azurerm_client_config" "KitKeyVlt" {}

resource "azurerm_key_vault" "KitKeyVlt" {
  name                       = var.key_vault_name
  location                   = var.HubIdentity_location
  resource_group_name        = azurerm_resource_group.HubIDMRG.name
  tenant_id                  = data.azurerm_client_config.KitKeyVlt.tenant_id
  sku_name                   = var.Hubkeyvault_sku_name
  soft_delete_retention_days = var.Hubkeyvault_softdelete_retention_days
}

data "azurerm_client_config" "Spokecurrentconfiguration" {}

resource "azurerm_key_vault" "SpkKeyVlt" {
  name                       = var.Spoke_key_vault_name
  location                   = var.Spoke_SharedSvcs_location
  resource_group_name        = azurerm_resource_group.SharedSvcsRG.name
  tenant_id                  = data.azurerm_client_config.Spokecurrentconfiguration.tenant_id
  sku_name                   = var.Spokekeyvault_sku_name
  soft_delete_retention_days = var.Spokekeyvault_softdelete_retention_days
}




data "azurerm_client_config" "currentconfiguration" {}

resource "azurerm_key_vault" "KitKeyVlt" {
  name                       = var.key_vault_name
  location                   = var.HubIdentity_location
  resource_group_name        = azurerm_resource_group.HubIDMRG.name
  tenant_id                  = data.azurerm_client_config.currentconfiguration.tenant_id
  sku_name                   = var.Hubkeyvault_sku_name
  soft_delete_retention_days = var.Hubkeyvault_softdelete_retention_days
}

data "azurerm_client_config" "Spokecurrentconfiguration" {}

resource "azurerm_key_vault" "SpkKeyVlt" {
  name                       = var.Spoke_key_vault_name
  location                   = var.Spoke_SharedSvcs_location
  resource_group_name        = azurerm_resource_group.SharedSvcsRG.name
  tenant_id                  = data.azurerm_client_config.Spokecurrentconfiguration.tenant_id
  sku_name                   = var.Spokekeyvault_sku_name
  soft_delete_retention_days = var.Spokekeyvault_softdelete_retention_days
}
