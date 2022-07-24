variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "location" {
  type        = string
  description = "Resources location in Azure"
}

variable "cluster_name" {
  type        = string
  description = "AKS name in Azure"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
}

variable "system_node_count" {
  type        = number
  description = "Number of AKS worker nodes"
}

variable "admin_username" {
  type        = string
  description = "Admin name in Azure"
}

variable "admin_password" {
  type        = string
  description = "Password for server"
}

variable "postgre_sql_name" {
  type        = string
  description = "Name of postgersql"
}

variable "db1_name" {
  type = string
  description = "Name of the first DB"
  
}

variable "db2_name" {
  type = string
  description = "Name of Second DB" 
}


variable "storage-account-name" {
  type = string
  description = "Name of the storage account"
}

variable "container-name" {
  type = string
  description = "Name of the container"
}