# SunnyCorp — Final Verification and Portfolio Handoff

## Portfolio scope

**Scenario:** Fictional 50-employee business, five departments, three VMs, six hands-on technical phases.

## Completed checks

| Area | Status |
|---|---|
| Six documented hands-on phases | Complete |
| Main README, glossary, navigation | Complete |
| Three original architecture diagrams | Uploaded |
| Nineteen original chat evidence images | Uploaded |
| Local failed-login detection | Demonstrated in lab |
| Windows Event Forwarding | Authentication events confirmed at collector |
| AD lifecycle and privileged-group audit | Historical events verified |
| IR-001 case write-up | Uploaded as a sanitized portfolio reconstruction |
| PowerShell sample scripts | Uploaded with testing qualifications |
| Relative README, diagram, gallery and guide links | Source-path audit passed |
| Text-file credential-pattern scan | No obvious secrets found in inspected sources |
| Temporary ZIP-extraction workflow | Removed |
| Repository visibility | Private |

## Findings and limits

- **Central analysis script:** Not executed as one full script on a Windows VM; review, run and capture the result before treating it as live-tested.
- **Security event completeness:** Some later Event 4625 records were missing from the collector at the final check, despite earlier 4625 evidence arriving successfully. We documented the incomplete investigation.
- **Privacy:** The 19 real screenshots contain fictional user names, computer names, lab IPs and event timestamps. No plaintext credentials were identified during visual review, but publication still requires one owner pass through all images.
- **Visual architecture:** SVGs are explanatory summaries, not network traffic captures.
- **Single-DC deployment:** Appropriate for an isolated learning lab, not a production company design.

## Suggested final live test on SUNNY-FS01

Copy `scripts/Inspect-ForwardedSecurityEvents.ps1` from GitHub to SUNNY-FS01. Review it, then run from an administrator PowerShell terminal:

```powershell
.\Inspect-ForwardedSecurityEvents.ps1 -MaxEvents 2000 -Threshold 2
```

Expected type of output: count of matching 4624/4625/4672 events, recent failed logins and possible lab-threshold review flags. **Expected output is not proof of testing** until the actual machine output is captured.

## Public release checklist

- [ ] Personally inspect each of the 19 images at full resolution.
- [ ] Verify there are no secrets or unintended personal identifiers anywhere in the repository or history.
- [ ] Decide whether you want the fictional internal account names publicly searchable.
- [ ] Optionally run the drafted central-monitoring script on SUNNY-FS01.
- [ ] Change repository visibility from Private to Public only when comfortable.

**Status:** Portfolio artifacts assembled and source-audited. Live execution and final owner approval remain explicitly separate.

[← Documentation index](README.md) · [← Homepage](../README.md)
