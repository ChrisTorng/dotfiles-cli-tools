#!/usr/bin/env pwsh
# Opens a calculator REPL, preferring rink, then Python, then bc.
# Usage: math.ps1

Set-StrictMode -Version Latest

function Invoke-IfAvailable {
    param([string]$Command, [string[]]$Arguments = @())
    $cmd = Get-Command -Name $Command -ErrorAction SilentlyContinue
    if ($cmd) {
        & $cmd.Path @Arguments
        exit $LASTEXITCODE
    }
}

Invoke-IfAvailable -Command 'rink'
Invoke-IfAvailable -Command 'python3' -Arguments @('-i', '-c', 'from math import *; from statistics import *')
Invoke-IfAvailable -Command 'bc'

Write-Error "couldn't find any math program"
exit 1
