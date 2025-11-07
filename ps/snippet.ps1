#!/usr/bin/env pwsh
# Shortcut that forwards arguments to the snippets helper command.
# Usage: snippet.ps1 [args...]

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$snippetsScript = Join-Path $PSScriptRoot 'snippets.ps1'
if (Test-Path -LiteralPath $snippetsScript) {
    & $snippetsScript @args
    exit $LASTEXITCODE
}

& snippets @args
exit $LASTEXITCODE
