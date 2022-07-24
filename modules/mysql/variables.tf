variable "prefix" {
  type        = string
  description = "Prefix for the resource."
}

variable "env" {
  type        = string
  description = "Environment for the resource."
}

variable "rg_location" {
  type        = string
}

variable "rg_tags" {
  type        = map(string)
}

variable "rg_name" {
  type        = string
}

variable "db_name" {
  description="Name of the  DB"
}

variable "mysql_version" {
  type        = string
  description = "MySQL Server version to deploy"
  default     = "8.0"
}

variable "mysql_sku_name" {
  type        = string
  description = "MySQL SKU Name"
  default     = "B_Gen5_1"
}

variable "mysql_storage" {
  type        = string
  description = "MySQL Storage in MB, from 5120 MB to 4194304 MB"
  default     = "5120"
}
