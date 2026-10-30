# SunnyCorp PowerShell Scripts

These scripts illustrate how an administrator and SOC analyst can investigate Windows security events. They are **learning tools** for a controlled, fictional enterprise — not production SIEM detections.

| Script | Purpose | Validation status |
|---|---|---|
| [Detect-FailedLogins.ps1](Detect-FailedLogins.ps1) | Count local failed logins (Security Event 4625) by account over a chosen period. | **Tested in the lab**, matching the workflow that detected three failures for `adm.james.wilson`. Portfolio version includes comments and parameter validation; recheck on VM before public release. |
| [Inspect-ForwardedSecurityEvents.ps1](Inspect-ForwardedSecurityEvents.ps1) | Read selected events from SUNNY-FS01's central `ForwardedEvents` log and summarize failures by computer/account. | **New reusable draft, NOT yet executed as a complete script.** The underlying event queries were tested individually. |

## How to use

On the appropriate Windows VM, open **Windows PowerShell as Administrator** and review the file before running it.

```powershell
# On SUNNY-CL01 (local Security log)
.\Detect-FailedLogins.ps1 -Hours 2 -Threshold 3

# On SUNNY-FS01 (central ForwardedEvents log)
.\Inspect-ForwardedSecurityEvents.ps1 -MaxEvents 2000 -Threshold 2
```

If script execution is restricted, do **not** blindly change the machine-wide execution policy. Review the source and follow your organization's approved script-running procedures. In our isolated lab, we temporarily used `RemoteSigned` with `-Scope Process` after reviewing the local detection script.

## What the scripts do NOT do

- They do not run persistently, create scheduled jobs, send notifications, or automatically lock accounts.
- A three-failure threshold is deliberately low to demonstrate grouping; it is not a reliable real-world attack classification.
- Event records may be delayed, filtered or absent. The central script scans only the requested most recent event sample.
- The target-account extraction (`Properties[5]`) matches the 4625 event structure verified in this particular lab and should be revisited for other environments.
- They do not read or publish passwords.

## Publishing safety

Do not commit temporary credentials, real usernames of actual employees, raw password exports, VM snapshots, logs containing sensitive data, or environment secrets.

[← Main project](../README.md) · [Phase 06 guide](../docs/phase-06-security-monitoring.md)
