#!/usr/bin/env pwsh
# Displays images in mpv, looping each frame indefinitely.
# Usage: pix.ps1 <image-files...>

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [Parameter(ValueFromRemainingArguments = $true, Mandatory = $true)]
    [string[]]$Images
)

$cmd = Get-Command -Name mpv -ErrorAction SilentlyContinue
if (-not $cmd) {
    Write-Error 'mpv not found'
    exit 1
}

$arguments = @('--image-display-duration=inf', '--loop-file=inf') + $Images
& $cmd.Path @arguments
exit $LASTEXITCODE
