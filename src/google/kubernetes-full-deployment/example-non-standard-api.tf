# This can be used to create any kind of kubernetes resource
resource "kubernetes_manifest" "example_resource" {
  manifest = {
    apiVersion = "some-api.io/v1"
    kind       = "example-kind"
    metadata = {
      "name" : "name"
    }
    spec = {
      secretName = "secretName"
      privateKey = {
        algorithm = "some-algorithm"
        name      = "name"
      }
      usages = ["use case 1", "use case 2", "use case 3"]
    }
  }
}

# Example using kubernetes manifest to create a kubernetes deployment
resource "kubernetes_manifest" "example_deployment_2" {
  manifest = {
    apiVersion = "apps/v1"
    kind       = "Deployment"
    metadata = {
      name = "example-deployment-2"
      labels = {
        app = "app-name"
      }
    }
    spec = {
      replicas = 1
      select = {
        matchLabels = {
          app = "app-name"
        }
      }
      template = {
        metadata = {
          labels = {
            app = "app-name"
          }
        }
        spec = {
          containers = {
            name  = "container-name"
            image = "image:tag"
          }
          env = [
            {
              name  = "ENV_VAR_1"
              value = "RANDOM_VALUE"
            },
            {
              name  = "ENV_VAR_2"
              value = "RANDOM_VALUE"
            }
          ]
          ports = {
            containerPort = 3000
          }
        }
      }
    }
  }
}
