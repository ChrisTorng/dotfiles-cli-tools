#!/usr/bin/env pwsh
# Sends a desktop notification using notify-send or macOS scripting as fallbacks.
# Usage: notify.ps1 [title] [message]

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [string]$Title = 'Notification',
    [string]$Message = ([System.DateTime]::Now.ToString('o'))
)

function Try-Run {
    param([string]$Command, [string[]]$Arguments)
    $cmd = Get-Command -Name $Command -ErrorAction SilentlyContinue
    if (-not $cmd) { return $false }
    & $cmd.Path @Arguments
    return $LASTEXITCODE -eq 0
}

if (Try-Run -Command 'notify-send' -Arguments @('--expire-time=5000', $Title, $Message)) { exit 0 }

$js = @"
var app = Application.currentApplication();
app.includeStandardAdditions = true;
app.displayNotification(${([System.Text.Json.JsonSerializer]::Serialize($Message))}, {
  withTitle: ${([System.Text.Json.JsonSerializer]::Serialize($Title))},
});
"@

if (Try-Run -Command 'osascript' -Arguments @('-l', 'JavaScript', '-e', $js)) { exit 0 }

Write-Error "can't send notifications"
exit 1
