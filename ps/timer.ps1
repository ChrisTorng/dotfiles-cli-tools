#!/usr/bin/env pwsh
# Sleeps for the specified duration then plays a sound and sends a notification.
# Usage: timer.ps1 <seconds>

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [Parameter(Position = 0, Mandatory = $true)]
    [double]$Seconds
)

Start-Sleep -Seconds $Seconds

$sfxScript = Join-Path $PSScriptRoot 'sfx.ps1'
if (Test-Path -LiteralPath $sfxScript) {
    & $sfxScript 'ringaling'
} else {
    & sfx 'ringaling'
}

$notifyScript = Join-Path $PSScriptRoot 'notify.ps1'
if (Test-Path -LiteralPath $notifyScript) {
    & $notifyScript 'timer complete' "$Seconds"
} else {
    & notify 'timer complete' "$Seconds"
}
