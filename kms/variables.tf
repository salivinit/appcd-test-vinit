variable "name" {
  description = "The name of the KMS key"
  type        = string
}

variable "key_ring" {
  description = "The name of the KMS key ring"
  type        = string
}

variable "location" {
  description = "The location of the KMS key"
  type        = string
}

variable "project" {
  description = "The GCP project ID"
  type        = string
}

variable "key_algorithm" {
  description = "The algorithm used by the KMS key (e.g., GOOGLE_SYMMETRIC_ENCRYPTION)"
  type        = string
  default     = "GOOGLE_SYMMETRIC_ENCRYPTION"
}
