resource "google_kms_key_ring" "key_ring" {
  name     = var.key_ring
  location = var.location
  project  = var.project
}

resource "google_kms_crypto_key" "key" {
  name            = var.name
  key_ring        = google_kms_key_ring.key_ring.id
  purpose         = "ENCRYPT_DECRYPT"
  project         = var.project
}

output "key_name" {
  value = google_kms_crypto_key.key.name
}
