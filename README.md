
# Terraform GCP Infrastructure for Spring Petclinic

## Overview

This project uses **Terraform** to deploy and manage infrastructure for a Google Cloud Platform (GCP) environment. The infrastructure includes resources such as Google Cloud Storage (GCS) buckets, Key Management Service (KMS) keys, custom IAM roles, and service accounts. The project is structured using Terraform modules to keep the code modular, reusable, and maintainable.

## Folder Structure

The folder structure is designed to separate each resource into its own module. Here’s a breakdown of the directory layout:

```
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
```

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
   ```

## Usage

### 1. Clone the repository

```bash
git clone <repository-url>
cd TEST-APP
```

### 2. Configure variables

Before applying the Terraform configuration, edit the `variables.tf` file in the root directory to set your project ID, region, and other environment-specific variables.

For example:

```hcl
variable "project_id" {
  description = "The GCP project ID"
  type        = string
  default     = "my-gcp-project"
}

variable "region" {
  description = "The region where resources will be deployed"
  type        = string
  default     = "us-central1"
}
```

### 3. Initialize Terraform

Initialize the working directory, which downloads the required provider plugins and prepares Terraform to work.

```bash
terraform init
```

### 4. Plan the changes

Run a **plan** to see the changes Terraform will apply:

```bash
terraform plan
```

This command will display all the resources that Terraform is going to create or modify.

### 5. Apply the configuration

Once you're satisfied with the plan, apply the changes to create the resources:

```bash
terraform apply
```

Confirm the prompt by typing `yes`, and Terraform will start provisioning the resources.

### 6. Destroy resources (Optional)

If you want to tear down all the resources created by Terraform:

```bash
terraform destroy
```

## Variables

### Root Module Variables

- **`project_id`**: GCP project ID where the resources will be deployed.
- **`region`**: The GCP region to deploy resources (default: `us-central1`).
- **`location`**: Location for the resources (default: `us-central1`).
- **`environment`**: Environment name like `dev`, `test`, or `prod` (default: `dev`).

### Cloud Storage Module Variables

- **`name`**: Name of the GCS bucket.
- **`location`**: Location of the GCS bucket.
- **`project`**: GCP project ID for the storage bucket.
- **`predefined_acl`**: ACL for the GCS bucket (default: `private`).

### KMS Module Variables

- **`name`**: Name of the KMS key.
- **`key_ring`**: Name of the KMS key ring.
- **`location`**: Location of the KMS key.
- **`project`**: GCP project ID for KMS.
- **`key_algorithm`**: Algorithm used by the KMS key (default: `GOOGLE_SYMMETRIC_ENCRYPTION`).

### Custom Roles Module Variables

- **`role_id`**: ID of the custom IAM role.
- **`title`**: Title of the custom IAM role.
- **`description`**: Description of the custom IAM role.
- **`permissions`**: List of permissions assigned to the custom IAM role.

### Service Account Module Variables

- **`account_id`**: Service account ID.
- **`display_name`**: Display name for the service account.
- **`roles`**: List of roles assigned to the service account.
- **`project`**: GCP project ID for the service account.

## Outputs

### Cloud Storage Module

- **`bucket_name`**: The name of the Google Cloud Storage bucket.

### KMS Module

- **`key_name`**: The name of the KMS key created.

### Custom Roles Module

- **`custom_role_id`**: The ID of the custom IAM role created.

### Service Account Module

- **`service_account_email`**: The email address of the service account created.

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
