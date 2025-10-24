#!/usr/bin/env pwsh
# Repeatedly runs a command until it succeeds.
# Usage: tryna.ps1 <command> [args...]

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [Parameter(ValueFromRemainingArguments = $true, Mandatory = $true)]
    [string[]]$Command
)

$exe = $Command[0]
$arguments = @()
if ($Command.Length -gt 1) {
    $arguments = $Command[1..($Command.Length - 1)]
}

do {
    & $exe @arguments
    $code = $LASTEXITCODE
    if ($code -ne 0) {
        Start-Sleep -Milliseconds 500
    }
} while ($code -ne 0)
