terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.74.0"
    }
  }

  required_version = ">= 0.14"
}

provider "google" {
  project = var.PROJECT_ID
  region  = var.REGION
}

resource "google_container_cluster" "my-gke-cluster" {
  name     = "my-gke-cluster"
  location = var.REGION

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  # other settings...
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "hello-world-node-pool-1"
  location   = var.REGION
  cluster    = google_container_cluster.my-gke-cluster.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = var.SERVICE_ACCOUNT
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

data "google_client_config" "default" {}
