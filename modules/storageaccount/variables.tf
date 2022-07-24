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

variable "rg_tags" {
  type        = map(string)
  description = "Tag for the resource"
}

variable "rg_name" {
  type        = string
  description = "This is rg name to keep acr"
}

# Container common vars

variable "containers" {
  description = "Name of containers, if it contains illegal characters (,-_ etc) those will be truncated."
  type        = list(string)
}
