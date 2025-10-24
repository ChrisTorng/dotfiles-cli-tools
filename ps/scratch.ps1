#!/usr/bin/env pwsh
# Opens a temporary file in $env:EDITOR for quick notes, deleting it afterward manually if desired.
# Usage: scratch.ps1

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$tempFile = [System.IO.Path]::GetTempFileName()
Write-Output "Editing $tempFile"

$editor = $env:VISUAL
if (-not $editor -or $editor.Trim().Length -eq 0) {
    $editor = $env:EDITOR
}
if (-not $editor -or $editor.Trim().Length -eq 0) {
    $editor = 'vim'
}

& $editor $tempFile
exit $LASTEXITCODE
