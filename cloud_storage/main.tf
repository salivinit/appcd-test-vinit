resource "google_storage_bucket" "bucket" {
  name          = var.name
  location      = var.location
  project       = var.project
  force_destroy = true

  uniform_bucket_level_access = true
}

output "bucket_name" {
  value = google_storage_bucket.bucket.name
}
