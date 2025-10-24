#!/usr/bin/env pwsh
# Plays video in the terminal using mpv's tct video output.
# Usage: tuivid.ps1 <video-path>

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [Parameter(ValueFromRemainingArguments = $true, Mandatory = $true)]
    [string[]]$Files
)

$cmd = Get-Command -Name mpv -ErrorAction SilentlyContinue
if (-not $cmd) {
    Write-Error 'mpv not found'
    exit 1
}

$arguments = @('--quiet', '--vo=tct', '--vo-tct-256=yes', '--vo-tct-algo=plain', '--framedrop=vo') + $Files
& $cmd.Path @arguments
exit $LASTEXITCODE
