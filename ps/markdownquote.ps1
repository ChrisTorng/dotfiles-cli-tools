#!/usr/bin/env pwsh
# Wraps input in Markdown blockquote syntax while preserving blank lines.
# Usage: markdownquote.ps1 < input

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

while (($line = [Console]::In.ReadLine()) -ne $null) {
    $trimmed = $line.Trim()
    if ($trimmed.Length -eq 0) {
        Write-Output '>'
    } elseif ($trimmed.StartsWith('>')) {
        Write-Output $trimmed
    } else {
        Write-Output ("> $trimmed")
    }
}
