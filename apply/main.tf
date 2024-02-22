provider "kubernetes" {
  config_path = "~/.kube/config"  # Adjust the path based on your kubeconfig location
}

resource "kubernetes_namespace" "dev" {
  metadata {
    name = "dev"
  }
}

resource "kubernetes_deployment" "example" {
  metadata {
    name      = "example-deployment"
    namespace = kubernetes_namespace.dev.metadata[0].name
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "example-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "example-app"
        }
      }

      spec {
        container {
          image = "nginx:latest"
          name  = "example-container"
        }
      }
    }
  }
}
