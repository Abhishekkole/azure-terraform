resource "azurerm_storage_account" "storage_account" {
  name                = "${var.prefix}${var.env}web"
  resource_group_name = var.rg_name
  location            = var.rg_location
  tags                = var.rg_tags

  account_tier              = "Standard"
  account_replication_type  = "LRS"
  account_kind              = "StorageV2"
  enable_https_traffic_only = true
  allow_blob_public_access  = true

  static_website {
    index_document     = "index.html"
    error_404_document = "index.html"
  }
}
