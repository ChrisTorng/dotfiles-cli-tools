#!/usr/bin/env pwsh
# Runs ls with the provided arguments.
# Usage: l.ps1 [paths...]

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$Args
)

$showAll = $false
$longFormat = $false
$paths = @()
foreach ($arg in $Args) {
    switch ($arg) {
        '-a' { $showAll = $true; continue }
        '--all' { $showAll = $true; continue }
        '-l' { $longFormat = $true; continue }
        default { $paths += $arg }
    }
}

if (-not $paths) {
    $paths = @('.')
}

$items = Get-ChildItem -Force:$showAll -Path $paths -ErrorAction Stop

if ($longFormat) {
    $items | Select-Object Mode, LastWriteTime, @{Name='Size';Expression={ if ($_.PSIsContainer) { '' } else { '{0,10}' -f $_.Length } }}, Name | Format-Table -AutoSize
} else {
    $items | Select-Object -ExpandProperty Name
}
