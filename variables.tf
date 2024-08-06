variable "hcloud_token" {
  description = "Hetzner Cloud API token"
  sensitive   = true
}

variable "environment_name" {
  description = "Name of the environment"
  type        = string
}

variable "location" {
  description = "Location of the environment"
  type        = string
  default     = "nbg1"
}

variable "network_configuration" {
  description = "Network configurations"
  type = object({
    network_range = string
    subnets       = map(string)
  })
}
