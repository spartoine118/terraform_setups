resource "kubernetes_service" "example_service" {
  metadata {
    name      = "example_deployment"
    namespace = "example_deployment"
  }
  spec {
    selector = {
      component = "example_deployment"
    }
    port {
      port        = 80
      target_port = 3000
      protocol    = "TCP"
    }
    type = "ClusterIP"
  }
}
