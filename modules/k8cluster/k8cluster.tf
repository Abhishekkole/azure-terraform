resource "azurerm_kubernetes_cluster" "k8cluster" {
  name                = "${var.prefix}-${var.env}-k8scluster"
  location            = var.rg_location
  resource_group_name = var.rg_name
  dns_prefix          = "${var.prefix}-${var.env}-k8s"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = var.k8s_vm_size
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "k8clusternodepool" {
  count                 = var.nodepool_count
  name                  = "internal${count.index}"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.k8cluster.id
  vm_size               = "Standard_NC12"
  node_count            = 1
  tags                  = var.rg_tags
}
