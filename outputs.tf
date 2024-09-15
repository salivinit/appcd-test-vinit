output "kms_key_id" {
  value = module.kms_key.key_id
}

output "storage_bucket_name" {
  value = module.gcs_bucket.bucket_name
}

output "custom_role_id" {
  value = module.custom_role.role_id
}