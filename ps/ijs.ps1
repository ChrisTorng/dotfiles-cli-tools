#!/usr/bin/env pwsh
# Opens an interactive JavaScript REPL using Deno, Node, or osascript.
# Usage: ijs.ps1

Set-StrictMode -Version Latest

function Invoke-IfAvailable {
    param([string]$Command, [string[]]$Arguments = @())
    $cmd = Get-Command -Name $Command -ErrorAction SilentlyContinue
    if ($cmd) {
        & $cmd.Path @Arguments
        exit $LASTEXITCODE
    }
}

Invoke-IfAvailable -Command 'deno' -Arguments @('repl')
Invoke-IfAvailable -Command 'node'
Invoke-IfAvailable -Command 'osascript' -Arguments @('-il', 'JavaScript')

Write-Error 'no js runtime found'
exit 1
