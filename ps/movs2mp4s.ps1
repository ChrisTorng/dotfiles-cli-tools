#!/usr/bin/env pwsh
# Converts all .mov files in the current directory to .mp4 in parallel using ffmpeg.
# Usage: movs2mp4s.ps1

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$files = Get-ChildItem -Filter '*.mov' -File -ErrorAction SilentlyContinue
if (-not $files) {
    Write-Host 'no .mov files found'
    exit 0
}

$throttle = [Math]::Max(1, [Environment]::ProcessorCount)
$files | ForEach-Object -Parallel {
    $file = $PSItem
    $mp4Path = [System.IO.Path]::ChangeExtension($file.FullName, '.mp4')
    Write-Host "$($file.Name): converting to $(Split-Path -Leaf $mp4Path)..."
    $arguments = @('-i', $file.FullName, '-loglevel', 'error', $mp4Path)
    & ffmpeg @arguments
    if ($LASTEXITCODE -eq 0) {
        Write-Host "$($file.Name): converted to $(Split-Path -Leaf $mp4Path)."
    } else {
        Write-Host "$($file.Name): failed to convert, error code $LASTEXITCODE!"
    }
} -ThrottleLimit $throttle
