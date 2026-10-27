# Enterprise Migration Runbook

An adaptable planning and execution template for workload migration. This repository does **not** document a completed 100+ workload migration; replace every bracketed placeholder with reviewed, environment-specific information.

## Migration lifecycle

1. **Discover:** inventory owners, dependencies, data classifications, network flows, recovery objectives, and support requirements.
2. **Assess:** validate compatibility, target architecture, licensing, risk, and cost assumptions with application owners.
3. **Prepare:** confirm landing-zone readiness, identity, connectivity, observability, backups, change approvals, and tested rollback.
4. **Cut over:** follow the workload-specific change plan and verify health with agreed acceptance checks.
5. **Hypercare:** monitor against explicit exit criteria and hand over operational ownership.

## Use

- Start with `templates/workload-migration-checklist.md`.
- Assign accountable owners in `templates/raci.md`.
- Complete the rollback plan and evidence links before the change is approved.
- Maintain one runbook per workload; do not treat this generic template as authorization to change production.

Never put credentials, customer data, or sensitive network details in public issues or commits.
