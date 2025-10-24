#!/usr/bin/env pwsh
# Sends a desktop notification every few minutes as a reminder.
# Usage: nagd.ps1

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$Minutes = 20
$notifyScript = Join-Path $PSScriptRoot 'notify.ps1'

function Invoke-Notify {
    param([string]$Title, [string]$Message)
    if (Test-Path -LiteralPath $notifyScript) {
        & $notifyScript $Title $Message | Out-Null
        return $LASTEXITCODE -eq 0
    }
    return $false
}

Invoke-Notify -Title 'nag' -Message "you'll get a reminder every $Minutes minutes" | Out-Null

try {
    while ($true) {
        Start-Sleep -Seconds ($Minutes * 60)
        Invoke-Notify -Title 'nag' -Message "it's been $Minutes minutes" | Out-Null
    }
} catch [System.Management.Automation.PipelineStoppedException] {
    # Exit gracefully on Ctrl+C
} catch [System.OperationCanceledException] {
    # Exit gracefully on Ctrl+C
}
