# SunnyCorp — Security Investigation Report

**Case:** IR-001  
**Environment:** Simulated enterprise IT lab  
**Investigation period:** October 28–29, 2026 (VM timestamps)  
**Classification:** Authorized Security Testing  
**Disposition:** Closed — no confirmed security compromise  
**Report type:** Sanitized portfolio reconstruction based on verified investigation notes; the original lab report remains on SUNNY-DC01.

## Executive summary

SunnyCorp simulated incorrect employee passwords and reviewed historic Active Directory administrator actions to test its ability to **detect, investigate and explain security events**.

The tests showed that Windows logs can identify failed sign-ins and directory changes. Selected workstation events reached a central Windows Event Collector. The investigated actions were approved lab exercises, **not a real intrusion**.

## Systems in scope

| Machine | Role |
|---|---|
| SUNNY-CL01 | Windows 11 workstation; source of authentication events |
| SUNNY-DC01 | Domain Controller; source of user and group management events |
| SUNNY-FS01 | File server also serving as the central Windows Event Collector |

## Evidence and timeline

| Observed event | Evidence | Interpretation |
|---|---|---|
| Account created | Event **4720** for fictional user `alex.rivera`, Oct. 28, 2026, **7:02:49 PM** | Authorized onboarding |
| Account disabled | Event **4725** for `alex.rivera`, Oct. 28, **7:08:19 PM** | Authorized offboarding |
| Privileged-group addition | Event **4728**, Oct. 28, **7:16:43 PM** | `CORP\Administrator` added James's dedicated admin identity to `GG_Workstation_Admins` |
| Failed interactive logins | Event **4625** on SUNNY-CL01 | Test attempts using incorrect passwords; source `127.0.0.1` indicates local origin |
| Central authentication evidence | Forwarded **4624**, **4625**, **4672** from SUNNY-CL01 to SUNNY-FS01 | Windows Event Forwarding was operational |

**Specific example:** SUNNY-CL01 recorded two later failed sign-ins for `james.wilson` at approximately **5:53:30 PM** and **5:53:41 PM** on Oct. 29 (VM time). These later events were not confirmed on SUNNY-FS01 during our final query.

## Investigation method

1. Confirm that Windows Security log auditing was active.
2. Search events by ID, date, and target identity using PowerShell.
3. Interpret **logon type**, **failure reason**, and **source address**.
4. Review AD account lifecycle events (4720/4725) and security-group additions (4728).
5. Verify a source-initiated WEF subscription and inspect the collector's `ForwardedEvents` log.
6. Group failed logins by target account to demonstrate a simple detection threshold.

## Findings

- Authentication auditing and user/group management auditing were enabled.
- Incorrect password tests produced Event 4625.
- A local PowerShell detection script flagged three failed sign-ins for `adm.james.wilson` within a two-hour window.
- Windows Event Forwarding delivered Events 4624, 4625 and 4672 to SUNNY-FS01.
- The newer `james.wilson` failures were confirmed locally but not confirmed in the collector. WEF mode changed from **Normal** to **MinLatency**, with configured maximum latency changing from **900,000 ms** to **30,000 ms**.
- The inspected group membership change and onboarding/offboarding actions corresponded to known authorized work.

## Assessment and response

**Assessment:** Authorized lab testing. No evidence in the inspected records confirmed a real attacker or breach.

**Actions taken:** Reviewed the relevant logs, verified collection health, adjusted the demonstration subscription delivery configuration, and documented the event timeline.

**Containment:** No emergency containment was necessary. Normal authorized test-account offboarding had already been completed as a separate administrative exercise.

## Limitations

- Event forwarding was not proven complete for every new record. Some later failed logins remained absent on the collector at the last check.
- This simulated setup is not a production SIEM, continuous SOC, or comprehensive enterprise detection system.
- Tests were conducted with fictional accounts on isolated VMs; the event dates reflect VM clocks.
- The report is a cleaned-up GitHub write-up, not a forensically validated external incident report.

## Lessons learned

A security event is **evidence to interpret**, not automatically proof of an attack. Analysts should verify the affected identity, timeframe, source, outcome and system context, then document uncertainty clearly.

---

[Read Phase 06](../docs/phase-06-security-monitoring.md) · [Return to homepage](../README.md)
