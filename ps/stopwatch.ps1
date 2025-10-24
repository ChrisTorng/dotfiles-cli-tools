#!/usr/bin/env pwsh
# Measures elapsed time by timing stdin until EOF.
# Usage: stopwatch.ps1

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

function Format-Time([datetime]$dt) {
    return $dt.ToString('h:mm:sstt', [System.Globalization.CultureInfo]::InvariantCulture).ToUpperInvariant()
}

$start = Get-Date
Write-Output "$(Format-Time $start): stopwatch started (^D to stop)"

$buffer = New-Object char[] 4096
while (($read = [Console]::In.Read($buffer, 0, $buffer.Length)) -gt 0) {
    [Console]::Out.Write($buffer, 0, $read)
}

$end = Get-Date
Write-Output "$(Format-Time $end): stopwatch stopped"
$elapsed = $end - $start
Write-Output ("Elapsed: {0:c}" -f $elapsed)
