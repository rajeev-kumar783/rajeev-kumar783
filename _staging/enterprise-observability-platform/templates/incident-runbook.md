# Incident runbook: [service / alert]

## Ownership and impact

- Service owner: [team / on-call route]
- Severity definition: [internal policy reference]
- User-visible impact: [symptoms and affected scope]
- Related dashboard: [approved link]
- SLO / alert definition: [approved link]

## Triage decision tree

1. **Is the alert firing and is user impact confirmed?**
   - No: verify telemetry freshness, alert query, and known maintenance; record evidence.
   - Yes: continue and declare an incident using the organization's process.
2. **Are dependencies healthy?**
   - Check [dependency dashboard / health endpoint].
   - If degraded, engage the dependency owner and follow [dependency runbook].
3. **Did a recent approved change correlate with the start time?**
   - If yes, evaluate the documented rollback criteria with the change owner.
   - Do not make an unreviewed production change.
4. **Is the incident within the service team's control?**
   - If no, escalate through [internal escalation route] and maintain customer communications.
5. **Recovery verification**
   - Confirm user-facing health, error rate, latency, and backlog against agreed thresholds.
   - Keep monitoring for [observation window] before resolving.

## Evidence and follow-up

- Incident record: [link]
- Timeline and query links: [restricted location]
- Communications owner: [role]
- Post-incident review due: [date]
- Follow-up actions, owners, and dates: [link]
