#!/usr/bin/env pwsh
# Displays the 0-255 ANSI color codes.
# Usage: list-colors.ps1

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

for ($i = 0; $i -le 255; $i++) {
    Write-Host -NoNewline ("`e[38;5;{0}m{0} " -f $i)
}
Write-Host "`e[0m"
