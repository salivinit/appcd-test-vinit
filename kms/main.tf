resource "google_kms_key_ring" "key_ring" {
  name     = var.key_ring
  location = var.location
  project  = var.project
}

resource "google_kms_crypto_key" "key" {
  name     = "your-key-name"
  key_ring  = var.key_ring
  purpose   = "ENCRYPT_DECRYPT"

  rotation_period = "86400s" # 1 day
  version_template {
    algorithm = "GOOGLE_SYMMETRIC_ENCRYPTION"
  }
}

output "key_id" {
  value = google_kms_crypto_key.key.id
}

