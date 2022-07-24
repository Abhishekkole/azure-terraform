# - Storage Account Creation 
resource "azurerm_storage_account" "az_storage_account" {
  name                      = "${var.prefix}${var.env}sa"
  resource_group_name       = var.rg_name
  location                  = var.rg_location
  tags                      = var.rg_tags
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true
}

# - Container
# -
resource "azurerm_storage_container" "az_storage_container" {
  count                 = length(var.containers)
  name                  = element(var.containers, count.index) 
  storage_account_name  = azurerm_storage_account.az_storage_account.name
  container_access_type = "private"
}

# - Storage Account creation for media service

resource "azurerm_storage_account" "storage_media" {
  name                      = "${var.prefix}${var.env}mediaservice"
  resource_group_name       = var.rg_name
  location                  = var.rg_location
  tags                      = var.rg_tags
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true
}
# -



