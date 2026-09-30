output "container_id" {
  value = docker_container.nginx.id
}

output "url" {
  value = "http://localhost:${var.external_port}"
}
