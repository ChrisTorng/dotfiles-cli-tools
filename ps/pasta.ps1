#!/usr/bin/env pwsh
# Prints clipboard contents with platform-specific fallbacks.
# Usage: pasta.ps1

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

try {
    $content = Get-Clipboard -ErrorAction Stop
    if ($null -ne $content) {
        Write-Output $content
        exit 0
    }
} catch { }

function Try-Run {
    param([string]$Command, [string[]]$Arguments)
    $cmd = Get-Command -Name $Command -ErrorAction SilentlyContinue
    if (-not $cmd) { return $null }
    return & $cmd.Path @Arguments
}

$result = Try-Run -Command 'pbpaste'
if ($null -ne $result) { Write-Output $result; exit 0 }

$result = Try-Run -Command 'xclip' -Arguments @('-selection', 'clipboard', '-o')
if ($null -ne $result) { Write-Output $result; exit 0 }

$clipboardFile = '/tmp/clipboard'
if (Test-Path -LiteralPath $clipboardFile) {
    Get-Content -LiteralPath $clipboardFile
    exit 0
}

Write-Output ''
