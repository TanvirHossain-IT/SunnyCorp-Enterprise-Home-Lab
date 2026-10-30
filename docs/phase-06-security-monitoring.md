# Phase 06 — Become SunnyCorp's Security Analyst

> **The simple question:** If somebody makes a suspicious login attempt or changes permissions, how would we know?

## The everyday explanation

Imagine a security guard who reviews what happened at all the office doors. Windows records similar activity in **event logs**: employee sign-ins, mistakes, permission changes, and administrative operations.

In this phase, we learned how to read those events, send selected records from a workstation to a central server, and document an investigation.

## 1. Investigate a failed sign-in

On **SUNNY-CL01**, verified **Security** logging was enabled (about 23,153 events at that checkpoint) and the `Logon` audit subcategory recorded **Success and Failure**.

Simulated incorrect employee credentials in a controlled test. Windows recorded:

| Field | What it told us |
|---|---|
| Event ID `4625` | An account failed to log on |
| Target | `james.wilson`, with separate tests for `adm.james.wilson` |
| Logon type `2` | Interactive (at the workstation) |
| Substatus `0xC000006A` | Incorrect password |
| Source `127.0.0.1` | Local loopback address, not an external attacker |

The failed attempts were **authorized simulations**, not real malicious activity.

## 2. Build a basic detection script

Queried recent Event 4625 records, grouped by target account and flagged counts above a chosen demonstration threshold.

A reusable local script was saved on the workstation as `C:\SunnyCorp\Scripts\Detect-FailedLogins.ps1`.

**Verified result:** The script flagged **three failed sign-ins** for `adm.james.wilson` in a two-hour window. The threshold is deliberately low for the lab and **is not a production-ready brute-force rule**.

The PowerShell execution policy initially blocked the script. We temporarily selected `RemoteSigned` **for the current process only**, rather than permanently relaxing the machine-wide setting.

## 3. Build a central event collection server

Configured **SUNNY-FS01** as the **Windows Event Collector**:

1. Initialized `Wecsvc` with `wecutil qc`; verified it was Running/Automatic.
2. Verified WinRM was configured.
3. Created the **source-initiated** subscription `SunnyCorp - Workstation Security Monitoring`.
4. Targeted `SUNNY-CL01` and selected Windows Security events `4624`, `4625`, and `4672`.
5. Used a Workstations-OU GPO to point clients at `http://SUNNY-FS01.corp.sunnylab.test:5985/wsman/SubscriptionManager/WEC`, refreshing every 60 seconds.
6. Added `NT AUTHORITY\NETWORK SERVICE` to the workstation's **Event Log Readers** local group through Group Policy.
7. Verified subscription creation (client forwarding log Event **100**) and collector runtime health.

### Proof that forwarding works

The **Forwarded Events** log on SUNNY-FS01 contained records from `SUNNY-CL01.corp.sunnylab.test`:

| Event ID | Meaning | Verified on collector |
|---|---|---|
| `4624` | Successful logon | Yes |
| `4625` | Failed logon | Yes — two earlier administrator-account events |
| `4672` | Special privileges assigned during logon | Yes |

**Troubleshooting we learned:** Initially only Event 111 appeared, then restarting the workstation refreshed its service permissions and real Security events became visible.

We investigated a delivery delay for two more recent `james.wilson` failures. They were visible locally but not yet confirmed in the collector. We changed subscription mode from **Normal (15-minute maximum latency)** to **MinLatency (30-second configured latency)**, then moved on without fully resolving the backlog. **This is an open limitation**, not a claim that all events were delivered.

## 4. Monitor changes to employee accounts and privileges

On SUNNY-DC01, verified that AD auditing for **User Account Management** and **Security Group Management** recorded successful changes.

Investigated historic lab actions:

| Event | Meaning | What we found |
|---|---|---|
| `4720` | User created | `alex.rivera` created on Oct. 28, 2026 (VM time) |
| `4725` | User disabled | `alex.rivera` disabled on Oct. 28, 2026 (VM time) |
| `4728` | User added to a global security group | `CORP\Administrator` added James's dedicated admin identity to `GG_Workstation_Admins` |

These were authorized IT changes, not evidence of compromise.

## 5. Document the investigation

Created the Markdown report:

`C:\SunnyCorp\Reports\IR-001-Security-Investigation.md`

Verified the file existed and was nonempty (2,530 bytes at the checkpoint).

**Investigation outcome:** **Authorized Security Testing — Closed.** No confirmed real intrusion. No emergency account containment was necessary.

The original report will be reviewed and copied into the repository's `reports/` folder after removing sensitive details and validating the content.

## What we learned

- An alert is **a reason to investigate**, not automatic proof of a breach.
- Check the **account, source, time, logon type, and result** before making claims.
- Compare local events with central logs; forwarding may involve latency and permissions issues.
- Keep a clear line between **configured**, **observed**, and **not yet verified**.

## Useful verification commands

```powershell
# Local failed logons
Get-WinEvent -FilterHashtable @{LogName='Security';Id=4625;StartTime=(Get-Date).AddHours(-2)}

# Central server: recent received events
Get-WinEvent -LogName ForwardedEvents -MaxEvents 20 |
    Format-Table TimeCreated,Id,MachineName -AutoSize

# Collector's live subscription state
wecutil gr "SunnyCorp - Workstation Security Monitoring"
```

## Lab status and limits

This is a small, isolated WEF deployment and manually executed detection, **not** a production SIEM or around-the-clock monitoring service. There is no guarantee of comprehensive log coverage, 24/7 alerting, or automatic incident response.

[← Phase 05](phase-05-administration-security.md) · [All chapters](README.md)
