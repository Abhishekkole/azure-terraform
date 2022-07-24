## storage account outputs
output "azure-acc-name" {
  value       = azurerm_storage_account.az_storage_account.name
  description = "The name of the storage account."
 }

## storage container outputs

output "azure-container" {
  value       = azurerm_storage_container.az_storage_container.*.name
  description = "The name of the storage account container."
}

# storage account outputs for media service
output "storage_media_id" {
  value       = azurerm_storage_account.storage_media.id
  description = "media service storage account id."
 }


