# Terraform GCP Infrastructure for Spring Petclinic

## Overview

This project uses **Terraform** to deploy and manage infrastructure for a Google Cloud Platform (GCP) environment. The infrastructure includes resources such as Google Cloud Storage (GCS) buckets, Key Management Service (KMS) keys, custom IAM roles, and service accounts. The project is structured using Terraform modules to keep the code modular, reusable, and maintainable.

### Structure

TEST-APP/
│
├── main.tf                   # Root main Terraform file that calls all modules
├── variables.tf               # Global variables for the root module
├── outputs.tf                 # Root-level output values
├── plan.yaml                  # (Optional) Terraform plan configuration for CI/CD pipelines
├── apply.yaml                 # (Optional) Apply configuration for CI/CD pipelines
│
├── cloud_storage/             # Module for creating GCS buckets
│   ├── main.tf                # Resource definition for Cloud Storage
│   ├── outputs.tf             # Outputs for Cloud Storage module
│   ├── variables.tf           # Variables for Cloud Storage module
│   └── versions.tf            # Terraform version constraints
│
├── custom_roles/              # Module for defining custom IAM roles
│   ├── main.tf                # Resource definition for IAM custom roles
│   ├── outputs.tf             # Outputs for Custom Roles module
│   ├── variables.tf           # Variables for Custom Roles module
│   └── versions.tf            # Terraform version constraints
│
├── kms/                       # Module for creating KMS keys
│   ├── main.tf                # Resource definition for KMS keys
│   ├── outputs.tf             # Outputs for KMS module
│   ├── variables.tf           # Variables for KMS module
│   └── versions.tf            # Terraform version constraints
│
├── service_account/            # Module for creating Service Accounts
│   ├── main.tf                # Resource definition for Service Accounts
│   ├── outputs.tf             # Outputs for Service Accounts module
│   ├── variables.tf           # Variables for Service Accounts module
│   └── versions.tf            # Terraform version constraints


## Modules

This project is split into four modules:

1. **Cloud Storage** (`cloud_storage/`)
   - Manages the creation of a private Google Cloud Storage (GCS) bucket.
  
2. **KMS** (`kms/`)
   - Manages the creation of a KMS key and key ring for encrypting and decrypting sensitive data.
  
3. **Custom IAM Roles** (`custom_roles/`)
   - Defines custom IAM roles with a set of permissions tailored for the application's access needs.
  
4. **Service Account** (`service_account/`)
   - Creates a service account with specific roles for accessing GCS and KMS resources.

## Prerequisites

1. **Terraform**: Make sure Terraform is installed on your local machine. You can download it [here](https://www.terraform.io/downloads.html).
2. **GCP Project**: You need an active GCP project and appropriate permissions to create resources.
3. **GCP Credentials**: Set up Google Cloud credentials on your machine by running:
   ```bash
   gcloud auth application-default login
