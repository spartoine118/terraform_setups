terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.14.1"
    }
  }
}

#This is the provider setup for modules to use the correct google cloud project
provider "google" {
  project = var.PROJECT_ID
  region  = var.REGION
}

#Put google resources you want to create/modify from here on out
resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = var.REGION

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
}

#A node pool is basically a template for nodes to follow. In this case we will create 1 node that will use this template.
resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = var.REGION
  cluster    = google_container_cluster.primary.name
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
