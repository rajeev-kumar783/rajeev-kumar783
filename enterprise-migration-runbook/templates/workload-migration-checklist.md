# Workload migration checklist: [workload name]

## Ownership and scope

- Business owner: [name / team]
- Technical owner: [name / team]
- Change record: [link / identifier]
- Source and target: [environment names]
- Planned window and timezone: [date / time]
- Business impact and communications: [details]

## Discovery and readiness

- [ ] Confirm application components, dependencies, data flows, and external integrations.
- [ ] Confirm data classification, residency, retention, and compliance requirements.
- [ ] Record baseline availability, latency, throughput, and error rates.
- [ ] Agree recovery point objective and recovery time objective with the service owner.
- [ ] Validate target capacity, identity, network paths, DNS, certificates, and secrets handling.
- [ ] Confirm backup/restore evidence and observability coverage.
- [ ] Review cost estimate and operational ownership.
- [ ] Complete security, privacy, and change approvals.

## Cutover plan

| Step | Owner | Planned time | Validation / evidence | Status |
|---|---|---|---|---|
| [Pre-change checks] | [owner] | [time] | [evidence link] | Not started |
| [Reduce DNS TTL if applicable] | [owner] | [time] | [observed TTL] | Not started |
| [Execute approved change] | [owner] | [time] | [deployment record] | Not started |
| [Traffic transition] | [owner] | [time] | [health checks] | Not started |
| [Business acceptance] | [owner] | [time] | [approval] | Not started |

## Rollback decision and procedure

- Decision owner: [name / role]
- Rollback triggers: [measurable thresholds and observation window]
- Latest safe rollback time: [time and timezone]
- Procedure: [versioned steps and commands in an access-controlled system]
- Data consistency / write handling: [workload-specific approach]
- Verification after rollback: [checks and evidence]
- Escalation contacts: [approved internal contact path]

## Hypercare and closure

- [ ] Monitor agreed service-level indicators for [duration].
- [ ] Confirm no unresolved severity [level] incidents.
- [ ] Confirm backup, restore, alerting, and on-call ownership.
- [ ] Capture actual performance and cost against baseline.
- [ ] Obtain application owner acceptance and close the change record.
- [ ] Record lessons learned and follow-up actions with owners and due dates.
