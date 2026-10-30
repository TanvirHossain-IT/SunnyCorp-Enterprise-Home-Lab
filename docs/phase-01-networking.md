# Phase 01 — Build the Company Network

> **The simple question:** How can computers inside one company communicate while staying separate from the outside world?

## A story anyone can follow

Imagine a business moving into its first office. Before employees can work, the office needs wiring and a way for its computers to find one another. SunnyCorp's version of that office is a **private virtual network**, running on one physical computer.

No real networking equipment was purchased. We used **Oracle VirtualBox** to make virtual computers and connect them to a host-only network.

## What we built

| Part | Why it exists | Setting |
|---|---|---|
| Host-only virtual network | Lets our lab computers talk privately | `10.10.10.0/24` |
| Host machine adapter | Allows the real PC to reach the lab | `10.10.10.1` |
| SUNNY-DC01 | Our central identity and DNS server | `10.10.10.10` |
| SUNNY-FS01 | Our file and log server, added during Phase 4 | `10.10.10.20` |
| SUNNY-CL01 | Employee's Windows 11 workstation | `10.10.10.50` |

**Host-only** means these machines share a private virtual segment with the host; it is not the same as placing publicly reachable servers on the internet.

## What we did, step by step

### 1. Create a private network

- In VirtualBox, created **Host-Only Ethernet Adapter #2**.
- Assigned the host side the address `10.10.10.1` and chose the `10.10.10.0/24` network.
- Connected the VMs' network adapters to that same virtual network.

**Why this matters:** A clear network plan prevents confusion about which computer is which, and keeps tests contained.

### 2. Give each computer a fixed address

The Domain Controller uses `10.10.10.10`, the workstation uses `10.10.10.50`, and (later) the file server uses `10.10.10.20`.

Think of IP addresses as desk numbers: if a desk number keeps changing, coworkers can't reliably find it.

### 3. Point the workstation at company DNS

The client used SUNNY-DC01 (`10.10.10.10`) as its DNS server. DNS is how a friendly name like `SUNNY-DC01` is translated into a network address.

### 4. Test connectivity and fix firewall issues

We tested communication with `ping` and checked DNS/name resolution. When ICMP ping traffic was blocked by firewall settings, we investigated the rule rather than assuming the entire network had failed.

### 5. Save working checkpoints

VirtualBox snapshots were taken during setup so we could recover from configuration mistakes more easily.

## What we tested

| Test | Outcome |
|---|---|
| Machines can reach their intended private-network peers | Verified during setup |
| Workstation can use domain DNS | Verified before domain joining |
| Firewall can affect ICMP without breaking all services | Observed and troubleshot |
| All three systems share one consistent address scheme | Verified during the lab |

## Key terms

- **Virtual machine (VM):** A computer simulated in software.
- **IP address:** A device's network address.
- **Subnet:** The set of addresses belonging to a network.
- **DNS:** Translates names into addresses.
- **Firewall:** Controls permitted network connections.
- **Ping / ICMP:** A simple reachability test, not a complete test of every service.

## Security and limitations

This is an educational host-only lab, not a redundant production enterprise network. The addresses and domain name are deliberately private lab identifiers. Some later exercises temporarily enabled management services and explicitly scoped firewall rules; we document those decisions separately.

## What came next?

With the private network running, we could build the company's central login system.

[Next: Phase 02 — Active Directory →](phase-02-active-directory.md) · [All chapters](README.md)
