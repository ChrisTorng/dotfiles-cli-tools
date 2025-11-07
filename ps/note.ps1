#!/usr/bin/env pwsh
# Creates or opens a markdown note in ~/notes with an optional title or archive flag.
# Usage: note.ps1 [title] [--archive]

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$archive = $false
$titleParts = @()
foreach ($arg in $args) {
    switch ($arg) {
        '--archive' { $archive = $true; continue }
        '-a' { $archive = $true; continue }
        default { $titleParts += $arg }
    }
}
$title = [string]::Join(' ', $titleParts).Trim()

function Get-Filename {
    param([datetime]$Now, [string]$Title)
    $nowStr = $Now.ToString('yyyy-MM-dd')
    $cleanTitle = $Title.Trim().Replace('/', '_').Replace('\\', '_').Replace(':', '-')
    if ([string]::IsNullOrWhiteSpace($cleanTitle)) { return "$nowStr.md" }
    return "$nowStr $cleanTitle.md"
}

function Get-Editor {
    if ($env:VISUAL) { return $env:VISUAL }
    if ($env:EDITOR) { return $env:EDITOR }
    return 'vim'
}

$now = Get-Date
$notesPath = Join-Path ([Environment]::GetFolderPath('UserProfile')) 'notes'
$target = $notesPath
if (-not (Test-Path -LiteralPath $notesPath)) {
    New-Item -ItemType Directory -Path $notesPath -Force | Out-Null
}
if ($archive) {
    $target = Join-Path $target 'archive'
    $target = Join-Path $target ($now.ToString('yyyy'))
}

if (-not (Test-Path -LiteralPath $target)) {
    New-Item -ItemType Directory -Path $target -Force | Out-Null
    try {
        $cmd = Get-Command -Name chmod -ErrorAction Stop
        & $cmd.Path '700' $target | Out-Null
    } catch { }
}

$filename = Get-Filename -Now $now -Title $title
$fullPath = Join-Path $target $filename
$editor = Get-Editor

Push-Location $notesPath
try {
    & $editor $fullPath
    exit $LASTEXITCODE
} finally {
    Pop-Location
}
