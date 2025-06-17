terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.14.1"
    }
  }
}

provider "google" {
  project = var.PROJECT_ID
  region  = var.REGION
}

resource "google_cloud_run_v2_service" "cloud_run_1" {
  name     = "YOUR_SERVICE_NAME"
  location = var.REGION

  #Make it deletable
  deletion_protection = false

  #Allowed ingress traffic for the Container.
  ingress = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = "CONTAINER_IMAGE"
    }
  }
}

#Hack to make the cloud run invocable by anyone
resource "google_cloud_run_service_iam_binding" "service" {
  location = google_cloud_run_v2_service.cloud_run_1.location
  service  = google_cloud_run_v2_service.cloud_run_1.name
  role     = "roles/run.invoker"
  members = [
    "allUsers"
  ]
  depends_on = [google_cloud_run_v2_service.cloud_run_1]
}
