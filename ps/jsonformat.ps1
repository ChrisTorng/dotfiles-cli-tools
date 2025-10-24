#!/usr/bin/env pwsh
# Pretty-prints JSON from stdin using native PowerShell conversion.
# Usage: jsonformat.ps1 < data.json

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$text = [Console]::In.ReadToEnd()
if (-not $text) {
    exit 0
}

try {
    $json = $text | ConvertFrom-Json -ErrorAction Stop
} catch {
    Write-Output $text
    exit 0
}

$json | ConvertTo-Json -Depth 100
