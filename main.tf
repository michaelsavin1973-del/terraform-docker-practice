terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 4.5"
    }
  }
}

provider "docker" {}

variable "external_port" {
  type    = number
  default = 8083

  validation {
    condition     = var.external_port >= 1024 && var.external_port <= 65535
    error_message = "External port must be between 1024 and 65535."
  }
}

module "nginx" {
  source = "./modules/nginx"

  container_name = "terraform-nginx-practice"
  external_port  = var.external_port
}

output "container_id" {
  value = module.nginx.container_id
}

output "url" {
  value = module.nginx.url
}

moved {
  from = docker_image.nginx
  to   = module.nginx.docker_image.nginx
}

moved {
  from = docker_container.nginx
  to   = module.nginx.docker_container.nginx
}

