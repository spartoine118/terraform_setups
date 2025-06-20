#Get config map from yml file
resource "kubernetes_config_map" "example_config_1" {
  metadata {
    name      = "example-config-1"
    namespace = "test_namespace"
  }

  data = yamldecode(file("example-config.yml"))
}

# Manually write config map
resource "kubernetes_config_map" "example_config_2" {
  metadata {
    name      = "example-config-2"
    namespace = "test_namespace"
  }

  data = {
    env    = "dev"
    sample = "sample"
  }
}

#Can be done the same way as a config map
resource "kubernetes_secret" "database_url" {
  metadata {
    name      = "api-key"
    namespace = "test_namespace"
  }

  data = {
    SECRET = "SUPERSECRET"
  }
}

#Deployment example. This is represents a kubernetes deployment type file 
resource "kubernetes_deployment" "example_deployment" {

  metadata {
    name      = "example_deployment"
    namespace = "test_namespace"
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        component = "example_deployment"
      }
    }
    template {
      metadata {
        labels = {
          component = "example_deployment"
        }
      }
      spec {
        container {
          name  = "example_deployment"
          image = "example_deployment:tag"
          port {
            container_port = 3000
          }
          env_from {
            config_map_ref {
              name = "example-config-1"
            }
          }
          env_from {
            secret_ref {
              name = "api-key"
            }
          }
        }
      }
    }
  }
}
