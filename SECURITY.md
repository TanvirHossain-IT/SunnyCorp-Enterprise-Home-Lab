# SunnyCorp — Security and Responsible Publication

This repository documents a **fictional, isolated Windows enterprise lab** built for learning and job-portfolio purposes.

## What belongs here

- Sanitized, genuine lab screenshots.
- Architecture diagrams based on the lab's actual three-VM environment.
- PowerShell examples that do not contain account passwords, tokens or private keys.
- Honest summaries of verified results and documented limitations.

## Never upload

- Temporary credential files such as `temporary-credentials.xml`.
- Recovered or LAPS-managed passwords.
- Private keys, tokens, certificates with private keys or authentication cookies.
- Raw VirtualBox disk images, sensitive full Event Log exports or personal files.

## Open verification items

1. **Windows live test:** The complete `scripts/Inspect-ForwardedSecurityEvents.ps1` file is a prepared script and has not been executed end to end on SUNNY-FS01. Its constituent event-log queries were tested separately.
2. **Delayed log forwarding:** Two newer failed sign-ins were confirmed on SUNNY-CL01 but not at SUNNY-FS01 at the last check. Do not claim perfect event-delivery completeness.
3. **Policy effectiveness:** Some policy configurations were verified by effective settings; not every physical behavior or firewall block was retested.
4. **Public release:** Review all 19 screenshot images one last time in GitHub for personal or sensitive details. The screenshots use fictional Windows account names and internal lab addresses, but still require an owner review.

## Incident disclosure

No real incidents are described. The IR-001 report is an **authorized test exercise** and is labeled accordingly.

## Responsible workflow

Keep the repository private until the owner approves publication. When preparing public release, audit the current tree **and commit history**. If a credential has ever been committed, removing a file from the latest branch does not eliminate its presence in past commits; rotate affected credentials and consider history cleanup.

[← Project homepage](README.md)
