<#
.SYNOPSIS
    Inspect centrally forwarded SunnyCorp security events.
.DESCRIPTION
    Reads the ForwardedEvents log on SUNNY-FS01 and summarizes
    Event IDs 4624, 4625 and 4672. This is a companion script
    prepared for the portfolio based on verified lab commands.
    It has NOT yet been independently run as a .ps1 file in the lab.

    Run from an elevated PowerShell prompt on the collector.
    No changes are made to system configuration.
.EXAMPLE
    .\Inspect-ForwardedSecurityEvents.ps1 -MaxEvents 2000 -Threshold 2
.NOTES
    Log collection can be delayed or incomplete. A low lab threshold
    is for demonstration only and is NOT a production alert.
#>
param(
    [ValidateRange(1,50000)]
    [int]$MaxEvents = 2000,

    [ValidateRange(1,1000)]
    [int]$Threshold = 2
)

try {
    $allEvents = @(
        Get-WinEvent -LogName 'ForwardedEvents' -MaxEvents $MaxEvents -ErrorAction Stop
    )
}
catch {
    Write-Warning "Could not read ForwardedEvents: $($_.Exception.Message)"
    return
}

$relevant = @(
    $allEvents | Where-Object { $_.Id -in 4624,4625,4672 }
)

Write-Host "SunnyCorp - central event overview"
Write-Host "Events inspected: $($allEvents.Count) | Matching security events: $($relevant.Count)"

if ($relevant.Count -gt 0) {
    $relevant |
        Group-Object Id |
        Sort-Object Name |
        Select-Object Count, Name |
        Format-Table -AutoSize
}

$failures = @(
    $relevant |
        Where-Object { $_.Id -eq 4625 -and $_.Properties.Count -gt 5 } |
        ForEach-Object {
            [PSCustomObject]@{
                TimeCreated = $_.TimeCreated
                Computer    = $_.MachineName
                Account     = [string]$_.Properties[5].Value
            }
        }
)

if ($failures.Count -eq 0) {
    Write-Host "No forwarded Event 4625 entries in the inspected sample."
    return
}

Write-Host "Recent forwarded failed logins:"
$failures |
    Sort-Object TimeCreated -Descending |
    Select-Object -First 10 |
    Format-Table -AutoSize

$alerts = @(
    $failures |
        Group-Object { "$($_.Computer) | $($_.Account)" } |
        Where-Object { $_.Count -ge $Threshold } |
        Sort-Object Count -Descending
)

if ($alerts.Count -gt 0) {
    Write-Host "REVIEW: Repeated failures reached the lab threshold."
    $alerts | Select-Object Count, Name | Format-Table -AutoSize
}
else {
    Write-Host "No source/account combination reached the threshold."
}
