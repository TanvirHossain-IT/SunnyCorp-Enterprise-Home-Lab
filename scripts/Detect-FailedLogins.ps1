<#
.SYNOPSIS
    SunnyCorp - local failed-logon detection (lab exercise).
.DESCRIPTION
    Reads recent Security 4625 events on the computer where it is run,
    groups them by target account, and displays accounts reaching a
    demonstration threshold.

    This is a documented version of the script tested on SUNNY-CL01.
    It does not run continuously, block anyone, or send alerts.
    Run from an elevated Windows PowerShell session.
.EXAMPLE
    .\Detect-FailedLogins.ps1 -Hours 2 -Threshold 3
.NOTES
    A threshold of 3 is for a controlled learning lab, NOT a
    production-ready brute-force detection rule.
    Event 4625 target username is at Properties[5] for the
    Windows event version used in this lab.
#>
param(
    [ValidateRange(1,168)]
    [int]$Hours = 2,

    [ValidateRange(1,1000)]
    [int]$Threshold = 3
)

$events = @(
    Get-WinEvent -FilterHashtable @{
        LogName   = 'Security'
        Id        = 4625
        StartTime = (Get-Date).AddHours(-$Hours)
    } -ErrorAction SilentlyContinue
)

$alerts = @(
    $events |
        Group-Object { $_.Properties[5].Value } |
        Where-Object { $_.Count -ge $Threshold } |
        Select-Object Count, Name
)

if ($alerts.Count -gt 0) {
    Write-Host "SECURITY ALERT: Repeated failed logins detected"
    $alerts | Format-Table -AutoSize
}
else {
    Write-Host "No accounts reached the alert threshold."
}
