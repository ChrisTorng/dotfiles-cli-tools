#!/usr/bin/env pwsh
# Prevents sleep while waiting for a PID to exit using platform tools.
# Usage: waitfor.ps1 <pid>

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [Parameter(Position = 0, Mandatory = $true)]
    [int]$Pid
)

$caffeinate = Get-Command -Name caffeinate -ErrorAction SilentlyContinue
if ($caffeinate) {
    & $caffeinate.Path '-w' $Pid
    exit $LASTEXITCODE
}

$systemdInhibit = Get-Command -Name systemd-inhibit -ErrorAction SilentlyContinue
if ($systemdInhibit) {
    & $systemdInhibit.Path '--who=waitfor' "--why=Awaiting PID $Pid" 'tail' "--pid=$Pid" '-f' '/dev/null'
    exit $LASTEXITCODE
}

try {
    Wait-Process -Id $Pid -ErrorAction Stop
} catch {
    Write-Error $_.Exception.Message
    exit 1
}
