# DevSecOps Pipeline Automation Framework

A starter Azure Pipelines definition for validating Terraform and running representative IaC security checks. It is intentionally configured as a validation pipeline: **it does not deploy infrastructure**.

## Pipeline stages

1. Terraform formatting, initialization without a backend, and validation.
2. TFLint, Checkov, and Trivy configuration scans.
3. Optional Gitleaks scan when the Gitleaks binary is available on the agent.

Tool versions and agent images should be pinned and reviewed against your organization's approved supply-chain policy before adoption. Scanner results require human triage; a clean scan is not proof of security.

## Run locally

Requirements: Terraform, TFLint, Checkov, Trivy, and optionally Gitleaks.

```shell
terraform fmt -check -recursive
tflint --recursive
checkov -d .
trivy config .
gitleaks detect --no-git
```

Run commands only for tools installed in your environment. Review each tool's current installation and licensing documentation.

## Planned extensions

- Add authenticated plan generation with an isolated, least-privilege service connection.
- Add cost estimation and policy thresholds.
- Add drift detection with a read-only identity and alert routing.
- Add an approval-controlled deployment stage only after state, environment protections, and rollback procedures are implemented.

No secrets belong in YAML or repository files. Store credentials in protected Azure DevOps service connections or secret variables.
