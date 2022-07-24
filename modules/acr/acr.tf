# Azure Container Registry for APIS
resource "azurerm_container_registry" "acr_apis" {
  name                = "${var.prefix}${var.env}apisacr"
  resource_group_name = var.rg_name
  location            = var.rg_location
  tags                = var.rg_tags
  sku                 = "standard"
  admin_enabled       = true
}

# Azure Container Registry for IMAGE
resource "azurerm_container_registry" "acr_image" {
  name                = "${var.prefix}${var.env}imageacr"
  resource_group_name = var.rg_name
  location            = var.rg_location
  sku                 = "standard"
  admin_enabled       = true
}
