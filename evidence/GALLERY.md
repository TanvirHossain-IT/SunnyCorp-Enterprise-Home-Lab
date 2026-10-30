# SunnyCorp Evidence Gallery — Upload Checklist

**19 original chat screenshots have been located and curated into a separate evidence download package.** The binary PNG files are **not yet in this GitHub folder**. This index lists their intended names so we can upload them without guesswork.

| Phase | File to upload | What it demonstrates | Status |
|---|---|---|---|
| 1 | `01-network-connectivity.png` | Successful ping of the domain controller | Prepared; not yet in GitHub |
| 2 | `02-active-directory-promotion.png` | Domain Controller configuration completed | Prepared; not yet in GitHub |
| 2 | `03-domain-joined-workstation.png` | SUNNY-CL01 joined the domain | Prepared; not yet in GitHub |
| 3 | `04-fifty-department-employees.png` | Five departments with 10 fictional employees each | Prepared; not yet in GitHub |
| 3 | `05-department-security-groups.png` | Five employee security groups | Prepared; not yet in GitHub |
| 4 | `06-hr-network-drive.png` | HR employee mapped to H: network drive | Prepared; not yet in GitHub |
| 4 | `07-finance-access-denied.png` | Unauthorized Finance folder access denied | Prepared; not yet in GitHub |
| 4 | `08-hr-file-access-audit.png` | Event 4663 recorded an HR file access | Prepared; not yet in GitHub |
| 5 | `09-disabled-user-login.png` | Disabled test account blocked from signing in | Prepared; not yet in GitHub |
| 5 | `10-separated-admin-identity.png` | Dedicated admin account in workstation administrator group | Prepared; not yet in GitHub |
| 5 | `11-encrypted-laps-backup.png` | Encrypted LAPS backup with authorized decryptor | Prepared; not yet in GitHub |
| 5 | `12-defender-pua-blocking.png` | Microsoft Defender PUA blocking verified | Prepared; not yet in GitHub |
| 5 | `13-firewall-effective-logging.png` | Active firewall dropped-packet logging verified | Prepared; not yet in GitHub |
| 5 | `14-remote-it-administration.png` | PowerShell commands run remotely on SUNNY-CL01 | Prepared; not yet in GitHub |
| 6 | `15-failed-login-detection.png` | Detection script triggered on repeated failed logins | Prepared; not yet in GitHub |
| 6 | `16-centralized-event-forwarding.png` | Workstation security events in central collector | Prepared; not yet in GitHub |
| 6 | `17-forwarded-failed-logins.png` | Central collector shows two forwarded failed logins | Prepared; not yet in GitHub |
| 6 | `18-account-lifecycle-events.png` | AD user creation and disabling audit events | Prepared; not yet in GitHub |
| 6 | `19-admin-group-change-event.png` | Audited privileged-group membership change | Prepared; not yet in GitHub |

## How the screenshots were prepared

- The source files are genuine screenshots from the SunnyCorp ChatGPT lab conversation, not recreated output.
- Most remain unchanged. Two images were cropped to highlight the relevant File Explorer or access-denied dialog.
- No passwords, credential exports, or LAPS plaintext were intentionally included in the curated set.
- This is **selected evidence**, not a claim that every activity has a screenshot or that all 50 employee accounts were individually tested.

## To publish the original images

1. Download and extract the separately supplied **SunnyCorp Original Chat Evidence Package**.
2. In your **private** GitHub repository, open `evidence/` → **Add file** → **Upload files**.
3. Drag the 19 PNG images out of the extracted `evidence/` directory.
4. Commit and refresh the folder. We can then turn the table above into a clickable gallery.
5. Review each image before changing GitHub visibility to public.

Do not upload credentials, `temporary-credentials.xml`, tokens, or VM disk images. Keep evidence redactions honest and preserve original output values.

[← Main project](../README.md)
