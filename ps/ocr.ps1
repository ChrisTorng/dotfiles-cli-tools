#!/usr/bin/env pwsh
# Performs OCR on an image using tesseract and prints the recognized text.
# Usage: ocr.ps1 <image-path>

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [Parameter(Position = 0, Mandatory = $true)]
    [string]$ImagePath
)

if (-not (Test-Path -LiteralPath $ImagePath)) {
    Write-Error 'image not found'
    exit 1
}

$tesseract = Get-Command -Name tesseract -ErrorAction SilentlyContinue
if (-not $tesseract) {
    Write-Error "tesseract command not found"
    exit 1
}

& $tesseract.Path $ImagePath 'stdout'
exit $LASTEXITCODE
