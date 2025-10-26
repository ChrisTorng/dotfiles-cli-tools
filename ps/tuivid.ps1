#!/usr/bin/env pwsh
# Plays video in the terminal using mpv's tct video output.
# Usage: tuivid.ps1 <video-path>

param(
    [Parameter(ValueFromRemainingArguments = $true, Mandatory = $true)]
    [string[]]$Files
)

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$cmd = Get-Command -Name mpv -ErrorAction SilentlyContinue
if (-not $cmd) {
    Write-Error 'mpv not found'
    exit 1
}

$vo = if ($env:MPV_VO) { $env:MPV_VO } else { 'tct' }
$arguments = @('--quiet', "--vo=$vo", '--framedrop=vo')
if ($env:MPV_NO_AUDIO -eq '1') {
    $arguments += '--ao=null'
}
if ($vo -eq 'tct') {
    $arguments += @('--vo-tct-256=yes', '--vo-tct-algo=plain')
}
$arguments += $Files
& $cmd.Path @arguments
exit $LASTEXITCODE
