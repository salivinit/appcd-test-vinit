terraform {
  required_version = ">= 1.3"
  required_providers {

    google = {
      source  = "hashicorp/google"
      version = ">= 3.53, < 7"
    }
  }

  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-iam:custom_role_iam/v7.7.1"
  }

}