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