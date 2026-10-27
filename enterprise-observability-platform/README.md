# Enterprise Observability Platform

An operational design starter for Azure Monitor and Log Analytics. It provides checklists and runbook templates, not a deployed monitoring platform. Azure Monitor Agent, Data Collection Rules, Grafana, PagerDuty, SLOs, and alert routes must be configured and tested in the target environment.

## Design checklist

- [ ] Define service ownership, critical user journeys, and actionable SLIs.
- [ ] Choose an availability SLO and error-budget policy with service owners.
- [ ] Inventory diagnostic sources and classify data before collection.
- [ ] Apply least-privilege access and documented retention settings.
- [ ] Pilot Azure Monitor Agent and Data Collection Rules on a representative workload.
- [ ] Measure ingestion volume and cost; filter only after confirming needed signals remain.
- [ ] Configure alerts with an owner, severity, runbook, and tested notification route.
- [ ] Test alert delivery, dashboard access, and recovery procedures.

## Templates

- `templates/incident-runbook.md`: responder decision-tree outline.
- `templates/slo.md`: service SLO and error-budget worksheet.

Dashboards and alert thresholds should be based on real service behavior. Avoid exporting secrets or personal data into telemetry, and review retention and access controls before enabling collection.
