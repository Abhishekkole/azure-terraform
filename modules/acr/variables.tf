variable "name" {
  default=""
}

variable "resource_group_name" {
  default=""
}

variable "location" {
  default="eastus"
}

variable "sku" {
  description = "The SKU name of the container registry"
  default     = "Standard"
}
