# resource group common vars

variable "prefix" {
  type        = string
  description = "Prefix for the resource."
}

variable "env" {
  type        = string
  description = "Environment for the resource."
}

variable "rg_name" {
  type        = string
  description = "Resource group name of the resource"
  
}

variable "rg_location" {
  type        = string
  description = "The Azure Region"
}

variable "rg_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default     = {}
}