variable "role_id" {
  description = "The ID of the custom IAM role"
  type        = string
}

variable "title" {
  description = "The title of the custom IAM role"
  type        = string
}

variable "description" {
  description = "A description of the custom IAM role"
  type        = string
}

variable "permissions" {
  description = "List of permissions for the custom IAM role"
  type        = list(string)
}

variable "project" {
  description = "The GCP project ID"
  type        = string
}