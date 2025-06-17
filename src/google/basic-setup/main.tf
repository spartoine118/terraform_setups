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
