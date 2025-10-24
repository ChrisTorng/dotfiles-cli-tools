#!/usr/bin/env pwsh
# Shows the current time and today's calendar with the current date highlighted.
# Usage: rn.ps1

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$now = Get-Date
Write-Output ($now.ToString('h:mmtt on dddd, MMMM d, yyyy'))
Write-Output ''

$header = $now.ToString('MMMM yyyy')
$width = 20
$padding = [Math]::Max(0, [Math]::Floor(($width - $header.Length) / 2.0))
Write-Output ((' ' * [int]$padding) + $header)
Write-Output 'Su Mo Tu We Th Fr Sa'

$firstOfMonth = Get-Date -Year $now.Year -Month $now.Month -Day 1
$daysInMonth = [DateTime]::DaysInMonth($now.Year, $now.Month)
$dayOfWeek = [int]$firstOfMonth.DayOfWeek
$highlightStart = "`e[7m"
$highlightEnd = "`e[0m"
$day = 1

while ($day -le $daysInMonth) {
    $line = ''
    for ($col = 0; $col -lt 7; $col++) {
        if ($day -eq 1 -and $col -lt $dayOfWeek) {
            $line += '   '
            continue
        }
        if ($day -gt $daysInMonth) {
            $line += '   '
            continue
        }
        $formatted = ('{0,2}' -f $day)
        if ($day -eq $now.Day) {
            $formatted = "$highlightStart$formatted$highlightEnd"
        }
        if ($col -lt 6) {
            $line += "$formatted "
        } else {
            $line += $formatted
        }
        $day++
    }
    Write-Output $line.TrimEnd()
}
