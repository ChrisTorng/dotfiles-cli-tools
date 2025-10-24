#!/usr/bin/env pwsh
# Streams a preset internet radio station with mpv.
# Usage: radio.ps1 <lofi|trance|salsa|kfai>

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [Parameter(Position = 0, Mandatory = $true)]
    [string]$Station
)

$stations = @{
    'lofi'   = 'https://live.hunter.fm/lofi_low'
    'trance' = 'http://ubuntu.hbr1.com:19800/trance.ogg'
    'salsa'  = 'https://latinasalsa.ice.infomaniak.ch/latinasalsa.mp3'
    'kfai'   = 'https://kfai.broadcasttool.stream/kfai-1'
}

if (-not $stations.ContainsKey($Station)) {
    Write-Error "don't know $Station"
    exit 1
}

$cmd = Get-Command -Name mpv -ErrorAction SilentlyContinue
if (-not $cmd) {
    Write-Error 'mpv not found'
    exit 1
}

& $cmd.Path '--really-quiet' $stations[$Station]
exit $LASTEXITCODE
