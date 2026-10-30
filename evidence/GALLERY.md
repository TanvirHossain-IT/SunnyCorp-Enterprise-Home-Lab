# SunnyCorp — Original Lab Evidence Gallery

**19 genuine screenshots from the SunnyCorp lab conversation are now in this GitHub folder.** Click the individual image links to see the actual test results.

| Phase | Screenshot | What the original result shows |
|---|---|---|
| 1 | [Network connectivity](01-network-connectivity.png) | Successful ping of the domain controller |
| 2 | [AD configuration](02-active-directory-promotion.png) | Domain Controller configuration completed |
| 2 | [Domain-joined client](03-domain-joined-workstation.png) | SUNNY-CL01 joined the domain |
| 3 | [50 employee accounts](04-fifty-department-employees.png) | Five departments with 10 fictional employees each |
| 3 | [Department groups](05-department-security-groups.png) | Five employee security groups |
| 4 | [HR network drive](06-hr-network-drive.png) | HR employee mapped to H: network drive |
| 4 | [Finance access denied](07-finance-access-denied.png) | Unauthorized Finance folder access denied |
| 4 | [File access audit](08-hr-file-access-audit.png) | Event 4663 recorded an HR file access |
| 5 | [Offboarding denied](09-disabled-user-login.png) | Disabled test account blocked from signing in |
| 5 | [Admin separation](10-separated-admin-identity.png) | Dedicated admin account in workstation administrator group |
| 5 | [Encrypted LAPS backup](11-encrypted-laps-backup.png) | Encrypted LAPS backup with authorized decryptor |
| 5 | [Defender PUA blocking](12-defender-pua-blocking.png) | Microsoft Defender PUA blocking verified |
| 5 | [Firewall effective policy](13-firewall-effective-logging.png) | Active firewall dropped-packet logging verified |
| 5 | [Remote IT administration](14-remote-it-administration.png) | PowerShell commands run remotely on SUNNY-CL01 |
| 6 | [Failed-logon detection](15-failed-login-detection.png) | Detection script triggered on repeated failed logins |
| 6 | [Forwarded security events](16-centralized-event-forwarding.png) | Workstation security events in central collector |
| 6 | [Forwarded failed logins](17-forwarded-failed-logins.png) | Central collector shows two forwarded failed logins |
| 6 | [AD account lifecycle](18-account-lifecycle-events.png) | AD user creation and disabling audit events |
| 6 | [Privilege change audit](19-admin-group-change-event.png) | Audited privileged-group membership change |

## How the screenshots were prepared

- The source files are genuine screenshots from the SunnyCorp ChatGPT lab conversation, not recreated output.
- Most remain unchanged. Two images were cropped to highlight the relevant File Explorer or access-denied dialog.
- No passwords, credential exports, or LAPS plaintext were intentionally included in the curated set.
- This is **selected evidence**, not a claim that every activity has a screenshot or that all 50 employee accounts were individually tested.

## Review before making the repository public

The images are original lab screenshots. Two were cropped to make relevant results clearer. There are no intentionally altered success values. Before publication, review each image for usernames, credential displays, system identifiers, and unrelated personal information.

## A few highlights

### HR department mapping
![HR mapped drive](06-hr-network-drive.png)

### Finance access denied
![Access denied to Finance share](07-finance-access-denied.png)

### Encrypted Windows LAPS backup
![Windows LAPS encrypted password record](11-encrypted-laps-backup.png)

### Security events centralized on SUNNY-FS01
![Windows Event Forwarding security logs](16-centralized-event-forwarding.png)

### Active Directory administrator-group change
![Event 4728 for workstation administrator membership](19-admin-group-change-event.png)

[← Main project](../README.md)
