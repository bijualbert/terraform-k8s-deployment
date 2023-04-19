# Configure the Kubernetes provider
provider "kubernetes" {
  config_path = var.kubeconfig_path
}

# Define input variables
variable "kubeconfig_path" {
  description = "Path to the Kubernetes config file"
}

variable "deployment_name" {
  description = "Name of the Kubernetes deployment"
  default     = "example-deployment"
}

variable "image_name" {
  description = "Name of the Docker image to deploy"
  default     = "nginx"
}

variable "replicas" {
  description = "Number of replicas to create"
  default     = 3
}

# Create a new Kubernetes deployment
resource "kubernetes_deployment" "example" {
  metadata {
    name = var.deployment_name
  }

  spec {
    selector {
      match_labels = {
        app = var.deployment_name
      }
    }

    replicas = var.replicas

    template {
      metadata {
        labels = {
          app = var.deployment_name
        }
      }

      spec {
        container {
          image = var.image_name
          name  = var.deployment_name

          ports {
            container_port = 80
          }
        }
      }
    }
  }
}

# Define output variables
output "deployment_name" {
  value = kubernetes_deployment.example.metadata[0].name
}

output "replicas" {
  value = kubernetes_deployment.example.spec[0].replicas
}

output "image_name" {
  value = kubernetes_deployment.example.spec[0].template[0].spec[0].container[0].image
}