locals {
  name          = var.environment_name
  network_range = var.network_configuration.network_range
  subnets       = var.network_configuration.subnets
  location_to_zone = {
    nbg1 = "eu-central",
    fsn1 = "eu-central",
    hel1 = "eu-central",
    ash  = "us-east",
    hil  = "us-west"
  }
}

resource "hcloud_network" "this" {
  name     = "${var.environment_name}-network"
  ip_range = var.network_configuration.network_range
  labels = {
    environment = var.environment_name
    creator     = "terraform"
  }
}

resource "hcloud_network_subnet" "this" {
  for_each     = var.network_configuration.subnets
  network_id   = hcloud_network.this.id
  type         = "cloud"
  network_zone = local.location_to_zone[var.location]
  ip_range     = each.value
}