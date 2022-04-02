variable "key_vault_name" {
  description = "Specifies the name of the Key Vault resource. Changing this forces a new resource to be created"
  type        = string
  default     = ""
}

variable "rg_name" {
  description = "Name of resource group to deploy resources in."
  type        = string
  default     = ""
}

variable "rg_location" {
  description = "Azure location where resources should be deployed."
  type        = string
  default     = ""
}

variable "rg_tags" {
  description = "Azure resource tags."
  type        = map(string)
  # default     = ""
}

variable "acr-name" {
  type       = string
  description =" name of ACR Registry"
  default     = ""
}


variable "database_name" {
  type       = string
  description = "Database name"
  default     = ""
}