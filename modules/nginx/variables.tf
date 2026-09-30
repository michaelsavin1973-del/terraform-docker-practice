variable "container_name" {
  type = string
}

variable "external_port" {
  type = number

  validation {
    condition     = var.external_port >= 1024 && var.external_port <= 65535
    error_message = "External port must be between 1024 and 65535."
  }
}
