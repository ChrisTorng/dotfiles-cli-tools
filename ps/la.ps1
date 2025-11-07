#!/usr/bin/env pwsh
# Runs ls -a with color flags appropriate for the current platform.
# Usage: la.ps1 [paths...]

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$Args
)

$showAll = $true
$longFormat = $false
$paths = @()
foreach ($arg in $Args) {
    switch ($arg) {
        '-l' { $longFormat = $true; continue }
        '-a' { $showAll = $true; continue }
        '--all' { $showAll = $true; continue }
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
