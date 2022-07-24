variable "prefix" {
  type        = string
  description = "Prefix for the resource."
}

variable "env" {
  type        = string
  description = "Environment for the resource."
}

variable "rg_location" {
    description="Location where CDN must be created"
    default="eastus"
}

variable "rg_name" {
    description="Name for reource group"
    default=""
}

variable "rg_tags" {
  type        = map(string)
  description = "Tag for the resource"
}

variable "k8s_vm_size" {
  type        = string
  description = "size of the node pool"
}

variable "nodepool_count" {
  type        = number
  description = "number of nodes"
}

variable "QA-ACR-CREDENTIALS"{
  type = string
  description = "Cerdentials of QA-ACR"
}


variable "QA-CDN-URL" {
  type = string
  description = "URL of QA CDN"
}


variable "QA-CONTAINER-WORKFLOW-IMAGE" {
  type = string
  description = "Container workflow image"
}

variable "QA-DBHOST" {
  type= string
  description = "Name of the QA Db Host"
}
