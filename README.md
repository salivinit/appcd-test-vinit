# Terraform GCP Infrastructure for Spring Petclinic

## Overview

This project uses **Terraform** to deploy and manage infrastructure for a Google Cloud Platform (GCP) environment. The infrastructure includes resources such as Google Cloud Storage (GCS) buckets, Key Management Service (KMS) keys, custom IAM roles, and service accounts. The project is structured using Terraform modules to keep the code modular, reusable, and maintainable.

### Structure

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
