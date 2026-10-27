# FinOps Automation Toolkit

Read-only starter utilities for cost-governance workflows. The included CSV script produces a VM rightsizing **candidate report** from supplied utilization data; it does not change or stop resources.

## VM utilization report

Input CSV columns: `resource_id,cpu_percent,memory_percent`. CPU/memory values must be numeric percentages from a consistent observation window. The script calculates nearest-rank P95 per resource and flags low-utilization candidates using configurable thresholds.

```shell
python rightsizing_report.py utilization.csv candidates.csv
python rightsizing_report.py --help
```

Treat results as investigation leads, not automatic resize recommendations: workload seasonality, memory pressure, latency, availability, licensing, and burst patterns need owner review. Resource utilization alone cannot establish a safe target SKU.

## Operational guardrails

- No script in this starter makes Azure changes or deletes resources.
- Review every candidate with the workload owner before taking action.
- Cost, telemetry, and inventory data may be sensitive; keep generated reports private.
- Scheduled start/stop, unattached-resource cleanup, and Log Analytics tuning are intentionally not automated here.
