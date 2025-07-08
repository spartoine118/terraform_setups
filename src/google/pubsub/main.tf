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

# Topic
resource "google_pubsub_topic" "example" {
  name = "example-topic"
}

# Subscription with push configuration
resource "google_pubsub_subscription" "subscription_push_example" {
  name  = "push-subscription"
  topic = google_pubsub_topic.example.id

  labels = {
    foo = "bar"
  }

  message_retention_duration = "1200s"

  ack_deadline_seconds = 20

  retry_policy {
    minimum_backoff = "10s"
  }

  enable_exactly_once_delivery = false

  push_config {
    push_endpoint = "https://example.com/push"

    attributes = {
      x-goog-version = "v1"
    }
  }
}

# Subscription with pull configuration
resource "google_pubsub_subscription" "subscription_pull_example" {
  name  = "pull-subscription"
  topic = google_pubsub_topic.example.id

  labels = {
    foo = "bar"
  }

  # 20 minutes
  message_retention_duration = "1200s"

  ack_deadline_seconds = 20

  retry_policy {
    minimum_backoff = "10s"
  }

  enable_message_ordering = false
}
