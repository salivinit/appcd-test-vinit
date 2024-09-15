# custom_roles/variables.tf

variable "role_id" {
  type = string
}

variable "title" {
  type = string
}

variable "description" {
  type = string
}

variable "permissions" {
  type = list(string)
}

variable "project" {
  type = string
}
