# resource group outputs
output "static_endpoint" {
  description = "static website url"
  value       = azurerm_storage_account.storage_account.primary_web_endpoint
}
