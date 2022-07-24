variable "prefix" {
  type        = string
  description = "Prefix for the resource."
}

variable "env" {
  type        = string
  description = "Environment for the resource."
}

variable "user_name" {
    description="Name of the user"
    default=""
}

variable "password" {
    description="Password for the user" 
    default=""
}