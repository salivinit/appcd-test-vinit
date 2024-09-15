
terraform {
  required_version = ">= 0.13"
  required_providers {

    google = {
      source  = "hashicorp/google"
      version = ">= 5.23.0, < 7"
    }
  }

  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-kms/v3.0.0"
  }

}