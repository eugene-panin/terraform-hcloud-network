# Network Creation Module

Creates a network in Hetzner Cloud.

## Providers

- [hetznercloud/hcloud](https://registry.terraform.io/providers/hetznercloud/hcloud/latest)

## Resources

- `hcloud_network` - creates a network for the environment
- `hcloud_network_subnet` - creates subnets for clusters and gateways

## Input Variables

| Name                   | Description                    | Type                       | Default  |
|------------------------|--------------------------------|----------------------------|----------|
| `hcloud_token`         | Hetzner Cloud API token        | sensitive                  |          |
| `environment_name`     | Name of the environment        | string                     |          |
| `location`             | Location of the environment    | string                     | `nbg1`   |
| `network_configuration`| Network configurations         | object (network_range, subnets) |          |

## Output Variables

| Name         | Description           |
|--------------|-----------------------|
| `network_id` | ID of the created network |

## Usage Example (Terraform)

```hcl
module "hetzner_environment" {
  source = "git::ssh://git@git.bestplace.tech:2222/devops/terraform_modules/hcloud-environment.git?ref=v0.0.1"
  hcloud_token = "vjrn4iunf4lih9r8hhr3ihw9f8hp2"
  environment_name = "test_env"
  location = "nbg1"
  network_configuration = {
    network_range = "10.130.0.0/16"
    subnets = {
      gateway = "10.130.10.0/30"
      cluster = "10.130.20.0/24"
    }
  }
}
```

## Usage Example (Terragrunt)

```hcl
terraform {
  source = "git::ssh://git@git.bestplace.tech:2222/devops/terraform_modules/hcloud-environment.git?ref=v0.0.1"
}

inputs = {
  hcloud_token = "vjrn4iunf4lih9r8hhr3ihw9f8hp2"
  environment_name = "test_env"
  location = "nbg1"
  network_configuration = {
    network_range = "10.130.0.0/16"
    subnets = {
      gateway = "10.130.10.0/30"
      cluster = "10.130.20.0/24"
    }
  }
}
```

## Notes

### Network Addressing

- Subnets must be within the `network_range` and not overlap.
- If you plan to deploy multiple environments, predefine the `network_range` to ensure routes do not overlap.