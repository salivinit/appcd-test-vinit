terraform {
  required_version = ">= 0.13"
  required_providers {

    google = {
      source  = "hashicorp/google"
      version = ">= 3.53, < 7"
    }
  }

  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-service-accounts/v4.4.0"
  }

}