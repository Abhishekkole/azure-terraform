# resource group outputs
output "rg_name" {
  description = "The Azure Region where the Resource Group exists"
  value       = azurerm_resource_group.az_resource_group.name
}
