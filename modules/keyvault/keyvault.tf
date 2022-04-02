data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "az_key_vault" {
  name                            = var.key_vault_name
  location                        = var.rg_location
  resource_group_name             = var.rg_name
  sku_name                        = "standard"
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled        = true

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = [
      "create",
      "get",
      "list",
    ]

    secret_permissions = [
      "set",
      "get",
      "list",
      "delete",
      "purge",
      "recover"
    ]
  }
}

#Key Vault Secret



resource "azurerm_key_vault_secret" "secrets_dbname" {
  name         = "DBNAME"
  value        = var.database_name
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_api_name" {
  name         = "ACR-Name"
  value        = var.acr-name
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

