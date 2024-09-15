
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
|── backend.tf                 # Root-level backend
|── providers.tf               # Provider fo the TF code
│
├── cloud_build/               # Cloud Build configuration folder
│   ├── apply.yaml             # Configuration for Terraform apply in CI/CD pipelines
│   └── plan.yaml              # Configuration for Terraform plan in CI/CD pipelines
|
├── cloud_storage/             # Module for creating GCS buckets
│   ├── main.tf                # Resource definition for Cloud Storage
│   ├── variables.tf           # Variables for Cloud Storage module
│   └── versions.tf            # Terraform version constraints
│
├── custom_roles/              # Module for defining custom IAM roles
│   ├── main.tf                # Resource definition for IAM custom roles
│   ├── variables.tf           # Variables for Custom Roles module
│   └── versions.tf            # Terraform version constraints
│
├── kms/                       # Module for creating KMS keys
│   ├── main.tf                # Resource definition for KMS keys
│   ├── variables.tf           # Variables for KMS module
│   └── versions.tf            # Terraform version constraints
│
├── service_account/            # Module for creating Service Accounts
│   ├── main.tf                # Resource definition for Service Accounts
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

## Cloud Build Integration

We use **Google Cloud Build** to automate the execution of Terraform commands (i.e., `terraform init`, `terraform plan`, and `terraform apply`) from the root directory of this repository.

### Cloud Build Configuration

The Cloud Build YAML file is located in the `cloud_build` directory (`cloud_build/apply.yaml` or `cloud_build/plan.yaml`). This YAML file automates the following steps:

1. **Display Branch Name**: Prints the current branch name being deployed.
2. **Terraform Init**: Initializes the Terraform environment from the root directory.
3. **Terraform Plan**: Runs the `terraform plan` command to show the execution plan for Terraform changes.
4. **Terraform Apply**: Applies the planned changes using `terraform apply` with the `-auto-approve` flag to automatically confirm the changes.

### Running Cloud Build with Terraform

Cloud Build executes the following commands to work with the Terraform files located in the root directory of this repository:

- **Terraform Init**:  
   Initializes Terraform from the root directory.
   ```bash
   terraform init
   ```

- **Terraform Plan**:  
   Generates an execution plan.
   ```bash
   terraform plan
   ```

- **Terraform Apply**:  
   Applies the Terraform configuration with automatic approval.
   ```bash
   terraform apply -auto-approve
   ```

### Cloud Build YAML Example

Here’s an example of the Cloud Build YAML file located in `cloud_build/plan.yaml`:

```yaml
steps:

# Step to print the branch name
- id: 'branch name'
  name: 'alpine'
  entrypoint: 'sh'
  args:
  - '-c'
  - |
      echo  "******************"
      echo  "$BRANCH_NAME"
      echo  "******************"

# Step to initialize Terraform from the root directory
- id: 'tf init'
  name: 'hashicorp/terraform'
  entrypoint: 'sh'
  args:
  - '-c'
  - |
      cd ..
      terraform init

# Step to plan Terraform from the root directory
# [START tf-plan]
- id: 'tf-plan'
  name: 'hashicorp/terraform'
  entrypoint: 'sh'
  args:
  - '-c'
  - |
      echo  "********TERRAFORM PLAN ***********"
      cd ..
      terraform plan 
# [END tf-plan]

# Step to apply Terraform from the root directory
# [START tf-apply]
- id: 'tf-apply'
  name: 'hashicorp/terraform'
  entrypoint: 'sh'
  args:
  - '-c'
  - |
      echo  "********TERRAFORM APPLY **********"
      cd ..
      terraform apply -auto-approve
# [END tf-apply]

timeout: 7200s
logsBucket: 'gs://bkt-demo-bucket-tfbackend'
```

This YAML file assumes that the `main.tf` file is located in the root directory and adjusts the directory accordingly (with `cd ..`) to run the commands from the correct location.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
