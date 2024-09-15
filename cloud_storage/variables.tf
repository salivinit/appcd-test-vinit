variable "name" {
  description = "The name of the Google Cloud Storage bucket"
  type        = string
}

variable "location" {
  description = "The location of the GCS bucket"
  type        = string
}

variable "project" {
  description = "The GCP project ID"
  type        = string
}

variable "predefined_acl" {
  description = "The predefined ACL for the GCS bucket (e.g., private, public-read)"
  type        = string
  default     = "private"
}
