# Terraform GCP Infrastructure for Spring Petclinic

## Overview

This project uses **Terraform** to deploy and manage infrastructure for a Google Cloud Platform (GCP) environment. The infrastructure includes resources such as Google Cloud Storage (GCS) buckets, Key Management Service (KMS) keys, custom IAM roles, and service accounts. The project is structured using Terraform modules to keep the code modular, reusable, and maintainable.

### Structure

The folder structure is designed to separate each resource into its own module. Here’s a breakdown of the directory layout:

TEST-APP/ │ ├── main.tf # Root main Terraform file that calls all modules ├── variables.tf # Global variables for the root module ├── outputs.tf # Root-level output values ├── plan.yaml # (Optional) Terraform plan configuration for CI/CD pipelines ├── apply.yaml # (Optional) Apply configuration for CI/CD pipelines │ ├── cloud_storage/ # Module for creating GCS buckets │ ├── main.tf # Resource definition for Cloud Storage │ ├── outputs.tf # Outputs for Cloud Storage module │ ├── variables.tf # Variables for Cloud Storage module │ └── versions.tf # Terraform version constraints │ ├── custom_roles/ # Module for defining custom IAM roles │ ├── main.tf # Resource definition for IAM custom roles │ ├── outputs.tf # Outputs for Custom Roles module │ ├── variables.tf # Variables for Custom Roles module │ └── versions.tf # Terraform version constraints │ ├── kms/ # Module for creating KMS keys │ ├── main.tf # Resource definition for KMS keys │ ├── outputs.tf # Outputs for KMS module │ ├── variables.tf # Variables for KMS module │ └── versions.tf # Terraform version constraints │ ├── service_account/ # Module for creating Service Accounts │ ├── main.tf # Resource definition for Service Accounts │ ├── outputs.tf # Outputs for Service Accounts module │ ├── variables.tf # Variables for Service Accounts module │ └── versions.tf # Terraform version constraints