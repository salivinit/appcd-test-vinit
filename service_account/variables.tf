variable "account_id" {
  description = "The ID of the service account"
  type        = string
}

variable "display_name" {
  description = "The display name for the service account"
  type        = string
}

variable "roles" {
  description = "List of roles to assign to the service account"
  type        = list(string)
}

variable "project" {
  description = "The GCP project ID"
  type        = string
}
