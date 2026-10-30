# SunnyCorp — Evidence & Screenshot Guide

**Status:** 19 original lab screenshot PNG files have been uploaded and are available in the [Evidence Gallery](GALLERY.md). The final privacy review remains pending.

The curated screenshots were extracted from the original lab conversation and uploaded to this folder. Each should still be reviewed before changing repository visibility to public.

## Evidence to gather

| Priority | Suggested file name | Proves | Status |
|---|---|---|---|
| 1 | `01-network-topology.png` | Network/VM addressing and connectivity | Uploaded |
| 2 | `02-domain-join.png` | SUNNY-CL01 joined to `corp.sunnylab.test` | Uploaded |
| 3 | `03-department-groups.png` | Employees organized into groups | Uploaded |
| 4 | `04-hr-drive-mapping.png` | HR employee automatically gets `H:` | Uploaded |
| 5 | `05-cross-department-access-denied.png` | HR account denied access to Finance | Uploaded |
| 6 | `06-employee-offboarding.png` | Disabled Alex account login rejected | Uploaded |
| 7 | `07-local-admin-gpo.png` | Workstation admin group applied | Uploaded |
| 8 | `08-laps-encrypted-backup.png` | LAPS backup and authorized decryptor **without password** | Uploaded |
| 9 | `09-defender-pua-block.png` | Defender PUAProtection = 1 | Uploaded |
| 10 | `10-firewall-effective-policy.png` | Firewall LogBlocked = True, 20 MB limit | Uploaded |
| 11 | `11-remote-it-session.png` | Remote PowerShell identifies SUNNY-CL01 and admin identity | Uploaded |
| 12 | `12-file-auditing-4663.png` | Audited HR file write | Uploaded |
| 13 | `13-wef-forwarded-events.png` | Actual 4624/4625/4672 events received centrally | Uploaded |
| 14 | `14-detection-script-alert.png` | Repeated login alert in lab | Uploaded |
| 15 | `15-account-security-audit.png` | AD Events 4720, 4725, 4728 | Uploaded |

## What a useful screenshot should show

- The **relevant computer name or tool** (without exposing personal details).
- The **command or policy** being tested.
- The **result that proves the claim**.
- A caption explaining the result in everyday language.

## Redaction checklist before uploading

- [ ] No plaintext passwords, private keys, tokens, API credentials, or recovery secrets.
- [ ] No `temporary-credentials.xml` or other credential exports.
- [ ] No unnecessary real-person identifiers, unrelated desktop items or personal files.
- [ ] No private host identifiers such as serial numbers or unrelated device details.
- [ ] No screenshots claiming that a setting worked unless the result verifies it.
- [ ] Images cropped for readability, with legitimate evidence preserved.

**Never fabricate or alter result values** in evidence. Cropping unrelated desktop areas and masking secrets is acceptable as long as the remaining technical result is genuine and understandable.

## Evidence vs explanation

The phase guides currently describe tests observed during the hands-on build. They are not a claim that all original screenshots have been committed. The technical phase guides now link to uploaded original screenshots.

[← Return to homepage](../README.md)
