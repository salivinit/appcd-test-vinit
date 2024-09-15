terraform {
  backend "gcs" {
    bucket  = "tf-test"
    prefix  = "terraform/state"
  }
}