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
  description = "This is acr location"
}

variable "rg_name" {
  type        = string
  description = "This is rg name to keep acr"
}

variable "rg_tags" {
  type        = map(string)
  description = "Tag for the resource"
}
