#!/usr/bin/env pwsh
# Re-encodes a video to H.264 with a chosen CRF for smaller output.
# Usage: shrinkvid.ps1 <input> <output> [crf]

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [Parameter(Position = 0, Mandatory = $true)]
    [string]$Input,
    [Parameter(Position = 1, Mandatory = $true)]
    [string]$Output,
    [Parameter(Position = 2)]
    [int]$Crf = 30
)

$cmd = Get-Command -Name ffmpeg -ErrorAction SilentlyContinue
if (-not $cmd) {
    Write-Error 'ffmpeg not found'
    exit 1
}

& $cmd.Path '-i' $Input '-c:v' 'libx264' '-tag:v' 'avc1' '-movflags' 'faststart' '-crf' $Crf '-preset' 'superfast' $Output
exit $LASTEXITCODE
