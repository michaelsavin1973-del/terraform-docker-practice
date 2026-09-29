terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 4.5"
    }
  }
}
provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:alpine"
  keep_locally = true
}

variable "external_port" {
  type    = number
  default = 8083

  validation {
    condition     = var.external_port >= 1024 && var.external_port <= 65535
    error_message = "External port must be between 1024 and 65535."
  }
}

resource "docker_container" "nginx" {
  name  = "terraform-nginx-practice"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = var.external_port
  }
}

output "container_id" {
  value = docker_container.nginx.id
}

output "url" {
  value = "http://localhost:${var.external_port}"
}
