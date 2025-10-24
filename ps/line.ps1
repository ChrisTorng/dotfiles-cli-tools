#!/usr/bin/env pwsh
# Prints the Nth line from stdin.
# Usage: line <number> < input

param(
    [Parameter(Mandatory = $true)]
    [int]$Number
)

if ($Number -le 0) {
    Write-Error 'Number must be positive.'
    exit 1
}

$inputText = [Console]::In.ReadToEnd()
if ($null -eq $inputText) {
    exit 0
}

$lines = $inputText -split "`r?`n"
if ($Number -le $lines.Length -and $Number -ge 1) {
    Write-Output $lines[$Number - 1]
}
