# Explore SunnyCorp — The Complete Build

**Start here if you want to understand how the lab was built.** Every chapter has two layers:

1. **The simple story:** What business problem are we solving, and why?
2. **The technical walkthrough:** Which systems, settings, and checks were used?

> **What is real?** The virtual machines, configuration work, and recorded test results. **What is simulated?** SunnyCorp is a fictional company with fictional staff and no real customer data.

## Choose a chapter

| Chapter | Beginner-friendly explanation | Main tools |
|---|---|---|
| [01 — The network](phase-01-networking.md) | Build the company's private digital roads | VirtualBox, TCP/IP |
| [02 — Company identity](phase-02-active-directory.md) | Create the company's employee sign-in desk | Windows Server, AD DS, DNS |
| [03 — Employees & rules](phase-03-users-and-policy.md) | Give 50 employees the right access and security rules | AD OUs, groups, PowerShell, GPO |
| [04 — Shared company files](phase-04-file-server.md) | Give each department its own locked filing cabinet | SMB, NTFS, Drive Maps, Event 4663 |
| [05 — Operate & protect IT](phase-05-administration-security.md) | Help new staff, manage admins, and protect workstations | LAPS, Defender, WinRM, Firewall |
| [06 — Investigate problems](phase-06-security-monitoring.md) | Record, collect, and interpret suspicious computer events | Event Viewer, WEF, PowerShell |

## The three virtual computers

| Name | Simple job | Technical role | Lab IP |
|---|---|---|---|
| `SUNNY-DC01` | The identity and rules desk | Windows Server 2025 domain controller and DNS | `10.10.10.10` |
| `SUNNY-FS01` | Shared filing cabinet and monitoring desk | Windows Server 2025 file server and Windows Event Collector | `10.10.10.20` |
| `SUNNY-CL01` | Employee's company laptop/desktop | Domain-joined Windows 11 workstation | `10.10.10.50` |

All systems connect to an isolated VirtualBox host-only lab network (`10.10.10.0/24`). Domain: `corp.sunnylab.test`.

## How to read the evidence

A setting shown in a screenshot is **configured**, not automatically **proven effective**. These guides distinguish:

- **Configured:** The policy, script, service, or permission was created.
- **Verified:** We observed a successful test or event proving behavior.
- **Limitation:** A test was not performed, was partial, or needs follow-up.

## Still to add to the repository

The guides document completed hands-on work. Selected original PowerShell files, incident report, and sanitized evidence screenshots will be uploaded separately after verifying their contents. They are not represented as uploaded here.

**Security:** Never commit temporary credentials, secrets, cached LAPS passwords, certificates/private keys, tokens, or raw machine exports. Review screenshots for identifiers and passwords before publishing.

[← Back to SunnyCorp homepage](../README.md)
