#!/usr/bin/env pwsh
# Prevents sleep while waiting for a PID to exit using platform tools.
# Usage: waitfor.ps1 <pid>

param(
    [Parameter(Position = 0, Mandatory = $true)]
    [int]$TargetPid
)

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$caffeinate = Get-Command -Name caffeinate -ErrorAction SilentlyContinue
if ($caffeinate) {
    & $caffeinate.Path '-w' $TargetPid
    if ($LASTEXITCODE -eq 0) {
        exit 0
    }
}

$systemdInhibit = Get-Command -Name systemd-inhibit -ErrorAction SilentlyContinue
$hasSystemd = Test-Path '/run/systemd/system'
if ($systemdInhibit -and $hasSystemd) {
    & $systemdInhibit.Path '--who=waitfor' "--why=Awaiting PID $TargetPid" 'tail' "--pid=$TargetPid" '-f' '/dev/null'
    if ($LASTEXITCODE -eq 0) {
        exit 0
    }
}

try {
    Wait-Process -Id $TargetPid -ErrorAction Stop
} catch {
    Write-Error $_.Exception.Message
    exit 1
}
