# Create a MySQL Server
resource "azurerm_mysql_server" "mysql_server" {
  name     = "${var.prefix}-${var.env}-mysql"
  location = var.rg_location
  tags =  var.rg_tags
  resource_group_name = var.rg_name
 
  administrator_login          = "mysqladmin"
  administrator_login_password = random_password.mysql_password.result
 
  sku_name = var.mysql_sku_name
  version  = var.mysql_version
 
  storage_mb        = var.mysql_storage
  auto_grow_enabled = true
  
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}

# Create a MySQL Database
resource "azurerm_mysql_database" "mysql_db" {
  name = var.db_name
  resource_group_name = var.rg_name
  server_name         = azurerm_mysql_server.mysql_server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}

resource "random_password" "mysql_password" {
  length = 32
  special = true
  override_special = "_%-+$#"
}