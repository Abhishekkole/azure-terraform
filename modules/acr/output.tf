output "acr_registry_name" {
    description = "Name of the ACR Registry"
    value = azurerm_container_registry.acr.name  
}