# Azure Production Landing Zone — Hub-and-Spoke

Reusable Terraform patterns for an Azure network foundation. The current example demonstrates map-driven `for_each`, reusable virtual-network and network-security-group modules, and dynamic NSG rule blocks.

> This is a portfolio starter, not a complete or production-certified Azure Landing Zone. It does not yet configure management groups, Azure Firewall, private DNS, policy assignments, identity/RBAC, routing, remote state, or production CI security gates. Validate security rules, address plans, and policy requirements with your organization before deployment.

## What is included

- `modules/virtual-network`: creates one VNet and a map of subnets.
- `modules/network-security-group`: renders an ordered list of rules through a Terraform `dynamic` block and associates the NSG to a subnet.
- Root configuration: creates a resource group and instantiates both modules with `for_each`.
- `examples/dev/terraform.tfvars.example`: sample hub and workload networks plus NSG rules.

The sample uses documentation-only IDs and addresses. Replace them with an approved subscription and non-overlapping address ranges before planning.

## Requirements

- Terraform `>= 1.6.0`
- AzureRM provider `~> 4.0`
- Azure CLI authentication (`az login`) or a service principal configured through the AzureRM provider's supported environment variables
- An Azure subscription and permission to create resource groups, VNets, subnets, and NSGs

## Validate locally

From this directory:

```shell
terraform fmt -recursive
terraform init -backend=false
terraform validate
```

To review a plan, copy the example file to `terraform.tfvars`, set a real subscription ID, and run:

```shell
terraform plan
```

Do not commit credentials, real `.tfvars` files, state files, or plans. This repository intentionally does not run `terraform apply` automatically.

## Terraform patterns

- Root `module` blocks iterate over `var.networks` and `var.security_groups`.
- Subnets iterate over a map in `modules/virtual-network`.
- NSG rule objects are expanded with a `dynamic "security_rule"` block in `modules/network-security-group`.
- Optional rule attributes have explicit defaults in the variable type.

## Next steps

Before calling this a production landing zone, add and test the required governance, identity, hub routing/firewall, private DNS, policy, remote-state, threat-model, and CI controls for the target tenant. Add integration tests in a dedicated non-production subscription; never apply the example to production without review and approval.
