provider "google" {
  project = var.project_id
  region  = var.region
}

# Cloud Storage Bucket
module "gcs_bucket" {
  source             = "./modules/cloud_storage"
  name               = "spring-petclinic-init"
  location           = var.location
  project            = var.project_id
  predefined_acl     = "private"
}

# KMS Key
module "kms_key" {
  source             = "./modules/kms"
  name               = "spring-petclinic-init-key"
  location           = var.location
  project            = var.project_id
  key_ring           = "projects/${var.project_id}/locations/${var.location}/keyRings/spring-petclinic-keyring"
  key_algorithm      = "GOOGLE_SYMMETRIC_ENCRYPTION"
}

# Custom IAM Role
module "custom_role" {
  source             = "./modules/custom_roles"
  role_id            = "spring_petclinic_custom_role"
  title              = "Spring Petclinic Custom Role"
  description        = "Custom role for Spring Petclinic GCP resources"
  permissions        = [
    "storage.buckets.get",
    "storage.objects.create",
    "storage.objects.delete",
    "storage.objects.get",
    "kms.cryptoKeys.get",
    "kms.cryptoKeyVersions.useToDecrypt",
    "kms.cryptoKeyVersions.useToEncrypt"
  ]
}

# Service Account
module "service_account" {
  source             = "./modules/service_account"
  account_id         = "spring-petclinic-sa"
  display_name       = "Service Account for Spring Petclinic"
  roles              = [
    "roles/storage.admin",
    "roles/cloudkms.cryptoKeyEncrypterDecrypter",
    "roles/iam.serviceAccountUser"
  ]
}
