#!/usr/bin/env pwsh
# Merges multiple PDFs into a single file using Ghostscript.
# Usage: mergepdfs.ps1 <output.pdf> <input.pdf...>

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [Parameter(Position = 0, Mandatory = $true)]
    [string]$OutputFile,
    [Parameter(Position = 1, Mandatory = $true, ValueFromRemainingArguments = $true)]
    [string[]]$InputFiles
)

function Invoke-Ghostscript {
    param([string[]]$Args)
    foreach ($name in @('gs', 'gswin64c', 'gswin32c')) {
        $cmd = Get-Command -Name $name -ErrorAction SilentlyContinue
        if ($cmd) {
            & $cmd.Path @Args
            return $LASTEXITCODE
        }
    }
    return $null
}

if (-not $InputFiles -or $InputFiles.Count -eq 0) {
    Write-Error 'must provide at least one input file'
    exit 1
}

$arguments = @('-q', '-dNOPAUSE', '-dBATCH', '-sDEVICE=pdfwrite', "-sOutputFile=$OutputFile") + $InputFiles
$code = Invoke-Ghostscript -Args $arguments
if ($code -eq $null) {
    Write-Error 'Ghostscript executable not found'
    exit 1
}
exit $code
