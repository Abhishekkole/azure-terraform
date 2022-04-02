output "k8s_name" {
    description="Name of the cluster"
    value=azurerm_kubernetes_cluster.k8cluster.name
}
