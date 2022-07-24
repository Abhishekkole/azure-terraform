output "acr_apis_name" {
  description = "The Registry name of APIS."
  value       = azurerm_container_registry.acr_apis.name
}

output "DEV-ACR-REGISTRY" {
  description = "The Registry name of APIS."
  value       = azurerm_container_registry.acr_apis.login_server
}

output "QA-ACR-CREDENTIALS" {
  description = "The username to login to apis acr."
  value       = azurerm_container_registry.acr_apis.admin_username
}

output "acr_apis_password" {
  description = "The password to login to apis acr."
  value       = azurerm_container_registry.acr_apis.admin_password
}

output "acr_image_name" {
  description = "The Registry name of Image."
  value       = azurerm_container_registry.acr_apis.name
}

output "acr_image_server" {
  description = "The Registry name of Image."
  value       = azurerm_container_registry.acr_image.login_server
}

output "acr_image_username" {
  description = "The username to login to image acr."
  value       = azurerm_container_registry.acr_apis.admin_username
}

output "acr_image_password" {
  description = "The password to login to image acr."
  value       = azurerm_container_registry.acr_apis.admin_password
}
