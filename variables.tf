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