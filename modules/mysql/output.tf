output "db_name" {
    description = "Name of DB Server"
    value = azurerm_mysql_server.mysql-server.name
  
}