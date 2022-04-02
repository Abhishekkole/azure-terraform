variable "prefix" {
  type        = string
  default     = ""
}

#location
variable "location" {
  type        = string
  default     = "east us"
}

variable "mysql-admin-login" {
  type        = string
  default     = "testadmin"
}

variable "mysql-admin-password" {
  type        = string
  default     = "admin@123"
}

variable "mysql-version" {
  type        = string
  description = "MySQL Server version to deploy"
  default     = "8.0"
}

variable "mysql-sku-name" {
  type        = string
  description = "MySQL SKU Name"
  default     = "B_Gen5_1"
}

variable "mysql-storage" {
  type        = string
  description = "MySQL Storage in MB, from 5120 MB to 4194304 MB"
  default     = "5120"
}
