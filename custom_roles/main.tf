resource "google_project_iam_custom_role" "custom_role" {
  role_id     = var.role_id
  title       = var.title
  description = var.description
  project     = var.project

  permissions = var.permissions
}

output "custom_role_id" {
  value = google_project_iam_custom_role.custom_role.role_id
}
