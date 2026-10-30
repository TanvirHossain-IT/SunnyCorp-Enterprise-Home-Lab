# Phase 04 — The Company's Secure Filing Cabinet

> **The simple question:** How can HR share files with HR, without letting Sales or Finance open them?

## The everyday explanation

SunnyCorp has five departments. Each department needs a shared digital filing cabinet. IT can manage the cabinet, but employees should only open their own department's drawers.

We built a dedicated server — **SUNNY-FS01** — and used two layers of permissions: **SMB share permissions** (who may enter through the network) and **NTFS permissions** (who may work with files once inside).

## What we built

| Department | Shared address | Automatic drive |
|---|---|---|
| IT | `\\SUNNY-FS01\IT` | `I:` |
| HR | `\\SUNNY-FS01\HR` | `H:` |
| Finance | `\\SUNNY-FS01\Finance` | `F:` |
| Sales | `\\SUNNY-FS01\Sales` | `S:` |
| Operations | `\\SUNNY-FS01\Operations` | `O:` |

The dedicated file server is Windows Server 2025, domain-joined at **10.10.10.20**.

## How we built it

### 1. Prepare the server

- Created SUNNY-FS01 in VirtualBox, connected it to the same private host-only network, and assigned a static IP and DNS pointing to SUNNY-DC01.
- Joined it to `corp.sunnylab.test`; verified the secure channel.
- Installed the Windows **File Server** role.

### 2. Create separate folders

Created `C:\SunnyCorp\Shares\IT`, `HR`, `Finance`, `Sales`, and `Operations`.

### 3. Secure each folder with group permissions

Each department's employee group received **Modify** permissions for its folder. We disabled inherited NTFS permissions and removed the broad **Users** entry, while retaining necessary system and administrator access.

Example verification command (read-only):

```powershell
icacls "C:\SunnyCorp\Shares\HR"
```

### 4. Publish the folders as SMB shares

Created five network shares with department-group Change permissions, administrator Full Control, and **Access-Based Enumeration**. The two permission layers both matter.

Example verification:

```powershell
Get-SmbShareAccess -Name HR
```

### 5. Map the correct drive automatically

Created the user Group Policy **SunnyCorp - Department Drive Mapping**. Group Policy Preferences map a different drive letter for each department and use **item-level targeting** tied to the matching security group.

A drive appears when an eligible employee signs in and the file server is available.

### 6. Record file activity for investigations

Enabled **Success and Failure** File System auditing on SUNNY-FS01 and configured an HR-folder audit rule for write activity by `GG_HR_Employees`. Then checked **Event ID 4663** in the server's Security log.

## What we tested

| Scenario | Actual result |
|---|---|
| James signs in from IT | `I:` appears; he can write an IT test file |
| James attempts another department | HR, Finance, Sales and Operations access denied |
| Sarah signs in from HR | `H:` appears; she can write an HR test file |
| Sarah attempts another department | Access denied |
| New HR hire Alex signs in (Phase 5) | Receives HR `H:` drive |
| Alex opens Finance share | Access denied |
| Sarah writes an HR audit test file | Event 4663 captured the account, file path, and `WriteData (or AddFile)` operation |

**Note on troubleshooting:** Drive mapping initially failed while SUNNY-FS01 was switched off. After starting it and refreshing/signing in again, drive mapping succeeded. Network availability is part of file-server availability.

## What the terms mean

- **SMB:** Windows protocol for accessing shared files across the network.
- **NTFS:** Windows file-system permissions controlling file and folder access.
- **Access-Based Enumeration:** Helps hide files/folders a user cannot access.
- **Drive mapping:** Giving a shared network folder a familiar drive letter.
- **Event 4663:** Audit record of access to an object when auditing is configured.

## Limits

We tested representative users and the HR audit rule, not every possible user/file combination. File System auditing alone does not guarantee a record for every rejected SMB connection; share-access auditing requires its own setup. Screenshots will be added only after reviewing them for sensitive data.

[← Phase 03](phase-03-users-and-policy.md) · [Next: Phase 05 →](phase-05-administration-security.md)
