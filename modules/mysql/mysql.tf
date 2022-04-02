resource "azurerm_resource_group" "mysql-rg" {
  name     = "${var.prefix}-mysql-rg"
  location = var.location
}

# Create a MySQL Server
resource "azurerm_mysql_server" "mysql-server" {
  name = "${var.prefix}-mysql-server"
  location = azurerm_resource_group.mysql-rg.location
  resource_group_name = azurerm_resource_group.mysql-rg.name
 
  administrator_login          = var.mysql-admin-login
  administrator_login_password = var.mysql-admin-password
 
  sku_name = var.mysql-sku-name
  version  = var.mysql-version
 
  storage_mb        = var.mysql-storage
  auto_grow_enabled = true
  
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}

# Create a MySQL Database for Dev
resource "azurerm_mysql_database" "mysql-db" {
  name                = "dev"
  resource_group_name = azurerm_resource_group.mysql-rg.name
  server_name         = azurerm_mysql_server.mysql-server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}

# Create a MySQL Database for QA
resource "azurerm_mysql_database" "mysql-qa" {
  name                = "qa"
  resource_group_name = azurerm_resource_group.mysql-rg.name
  server_name         = azurerm_mysql_server.mysql-server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}

# Create a MySQL Database for Production
resource "azurerm_mysql_database" "mysql-prod" {
  name                = "prod"
  resource_group_name = azurerm_resource_group.mysql-rg.name
  server_name         = azurerm_mysql_server.mysql-server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}
