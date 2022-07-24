resource "azurerm_resource_group" "az_resource_group" {
  name     = "${var.prefix}-${var.env}-rg"
  location = var.rg_location
  tags     = var.rg_tags
}
