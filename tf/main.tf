terraform {
  backend "gcs" {
    bucket  = "demo-tf-state-prod"
    prefix  = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = var.project_id
  credentials = var.creds
}

