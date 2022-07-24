#Creating Resource group for Tenant Resources
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

#Create a seperate Vnet with 3-subnets for AKS Cluster 
module "vnet" {
  source              = "../vnet"
  #source              = "Azure/vnet/azurerm"
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["20.0.0.0/16"]
  subnet_prefixes     = ["20.0.1.0/24","20.0.2.0/24","20.0.3.0/24"]
  subnet_names        = ["subnet1","subnet2","subnet3"]

  depends_on = [azurerm_resource_group.rg]
}

#Creation of AKS cluster with 3-nodes,auto-scaling:ON
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.cluster_name

  default_node_pool {
    name                = "system"
    node_count          = var.system_node_count
    vm_size             = "Standard_DS3_v2"
    type                = "VirtualMachineScaleSets"
    zones               = [1, 2, 3]
    enable_auto_scaling = true
    max_count           = 5
    min_count           = 3
    vnet_subnet_id      = module.vnet.vnet_subnets[2]
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "kubenet" # CNI
  }
}

#Creation of storage account for tenant
resource "azurerm_storage_account" "storage-account" {
  name                     = var.storage-account-name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Premium"
  account_replication_type = "LRS"
  account_kind             = "BlockBlobStorage"
  is_hns_enabled = "true"
}

#Creation of container in above storage account of type blob to store interview related files
resource "azurerm_storage_container" "storage-container" {
  name                  = var.container-name
  storage_account_name  = azurerm_storage_account.storage-account.name
  container_access_type = "blob"
}

#Creation of PostegreSQL Flexible server
resource "azurerm_postgresql_flexible_server" "postgersql" {
  name                   = var.postgre_sql_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = "11"
  administrator_login    = var.admin_username
  administrator_password = var.admin_password
  zone                   = "2"
  storage_mb = 131072
  sku_name   = "GP_Standard_D2ds_v4"
  backup_retention_days = "7"
  high_availability {
    mode                 = "ZoneRedundant"
    standby_availability_zone = "1"
  }
  

}

#Creation of PostegreSQL Database in Tenant Flexible server
resource "azurerm_postgresql_flexible_server_database" "db1" {
  name      = var.db1_name
  server_id = azurerm_postgresql_flexible_server.postgersql.id
  collation = "en_US.utf8"
  charset   = "utf8"
}

resource "azurerm_postgresql_flexible_server_database" "db22" {
  name      = var.db2_name
  server_id = azurerm_postgresql_flexible_server.postgersql.id
  collation = "en_US.utf8"
  charset   = "utf8"
}


