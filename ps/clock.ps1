#!/usr/bin/env pwsh
# Continuously displays the current time using watch.
# Usage: clock

param(
    [double]$IntervalSeconds = 1
)

while ($true) {
    Clear-Host
    Write-Output (Get-Date -Format 'h:mm:sstt')
    Start-Sleep -Seconds $IntervalSeconds
}
