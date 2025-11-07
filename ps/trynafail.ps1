#!/usr/bin/env pwsh
# Repeatedly runs a command until it fails.
# Usage: trynafail.ps1 <command> [args...]

param(
    [Parameter(ValueFromRemainingArguments = $true, Mandatory = $true)]
    [string[]]$Command
)

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$exe = $Command[0]
$arguments = if ($Command.Length -gt 1) { $Command[1..($Command.Length - 1)] } else { @() }

do {
    & $exe @arguments
    $code = $LASTEXITCODE
    if ($code -eq 0) {
        Start-Sleep -Milliseconds 500
    }
} while ($code -eq 0)
