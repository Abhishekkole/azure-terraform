output "sql_server_name" {
    description="Name of the server"
    value=azurerm_mysql_server.mysql-server.name
}

output "db_name1" {
    description="Name of first database"
    value=azurerm_mysql_database.mysql-db.name
}

output "db_name2" {
    description="Name of second database"
    value=azurerm_mysql_database.mysql-qa.name
}

output "db_name3" {
    description="Name of first database"
    value=azurerm_mysql_database.mysql-prod.name
}
