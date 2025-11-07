#!/usr/bin/env pwsh
# Strips EXIF metadata from JPEG images using jhead.
# Usage: removeexif.ps1 <files...>

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [Parameter(ValueFromRemainingArguments = $true, Mandatory = $true)]
    [string[]]$Files
)

$cmd = Get-Command -Name jhead -ErrorAction SilentlyContinue
if (-not $cmd) {
    Write-Error 'jhead not found'
    exit 1
}

& $cmd.Path '-purejpg' @Files
exit $LASTEXITCODE
