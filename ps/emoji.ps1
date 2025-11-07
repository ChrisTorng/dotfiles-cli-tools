#!/usr/bin/env pwsh
# Lists emoji codes, optionally filtered by a case-insensitive search term.
# Usage: emoji.ps1 [search-term]

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$dataPath = Join-Path $PSScriptRoot 'emoji-data.txt'
if (-not (Test-Path -LiteralPath $dataPath)) {
    Write-Error "emoji data file not found at $dataPath"
    exit 1
}
$lines = Get-Content -LiteralPath $dataPath
switch ($args.Count) {
    0 {
        foreach ($line in $lines) {
            $parts = $line -split '\s+'
            if ($parts[0]) { Write-Output $parts[0] }
        }
    }
    1 {
        $pattern = [Regex]::Escape($args[0])
        foreach ($line in $lines) {
            if ($line -match $pattern) {
                $parts = $line -split '\s+'
                if ($parts[0]) { Write-Output $parts[0] }
            }
        }
    }
    default {
        Write-Error 'expected at most one argument'
        exit 1
    }
}
