#!/usr/bin/env pwsh
# Grabs YouTube subtitles as plain text by calling yt-dlp and parsing VTT data.
# Usage: getsubs.ps1 <url>

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [Parameter(Position = 0, Mandatory = $true)]
    [string]$Url
)

if ($PSBoundParameters.Count -lt $args.Count) {
    Write-Error 'unexpected additional arguments'
    exit 1
}

function Invoke-YtDlpSubtitle {
    param(
        [string]$VideoUrl,
        [string]$Mode
    )

    $tempDir = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), [System.IO.Path]::GetRandomFileName())
    [System.IO.Directory]::CreateDirectory($tempDir) | Out-Null
    try {
        $outputPattern = [System.IO.Path]::Combine($tempDir, '%(id)s.%(ext)s')
        $arguments = @('--skip-download', $Mode, '--sub-lang', 'en', '--sub-format', 'vtt', '-o', $outputPattern, $VideoUrl)
        & 'yt-dlp' @arguments
        if ($LASTEXITCODE -ne 0) {
            return $null
        }
        $file = Get-ChildItem -Path $tempDir -Filter '*.vtt' | Select-Object -First 1
        if (-not $file) {
            return $null
        }
        return Get-Content -LiteralPath $file.FullName -Raw
    }
    finally {
        Remove-Item -LiteralPath $tempDir -Recurse -Force -ErrorAction SilentlyContinue
    }
}

function Get-VttLines {
    param([string]$Content)

    $lines = $Content -split "`r?`n"
    $results = [System.Collections.Generic.List[string]]::new()
    $buffer = ''
    foreach ($line in $lines) {
        $trimmed = $line.Trim()
        if (-not $trimmed) {
            if ($buffer) {
                $results.Add($buffer)
                $buffer = ''
            }
            continue
        }
        if ($trimmed -eq 'WEBVTT' -or $trimmed -like 'NOTE*' -or $trimmed -like 'STYLE*' -or $trimmed -like 'REGION*') {
            continue
        }
        if ($trimmed -match '^[0-9]+$') { continue }
        if ($trimmed -match '^[0-9]{2}:[0-9]{2}:[0-9]{2}\.[0-9]{3}.*-->.*$') { continue }
        $clean = [System.Text.RegularExpressions.Regex]::Replace($trimmed, '<[^>]+>', '')
        if ($clean) {
            if ($buffer) { $buffer += ' ' }
            $buffer += $clean
        }
    }
    if ($buffer) { $results.Add($buffer) }

    $deduped = [System.Collections.Generic.List[string]]::new()
    $previous = $null
    foreach ($entry in $results) {
        if ($entry -ne $previous) {
            $deduped.Add($entry)
            $previous = $entry
        }
    }
    return $deduped
}

$vttContent = Invoke-YtDlpSubtitle -VideoUrl $Url -Mode '--write-sub'
if (-not $vttContent) {
    $vttContent = Invoke-YtDlpSubtitle -VideoUrl $Url -Mode '--write-auto-sub'
}

if (-not $vttContent) {
    Write-Error 'no subs found'
    exit 1
}

foreach ($line in Get-VttLines -Content $vttContent) {
    Write-Output $line
}
