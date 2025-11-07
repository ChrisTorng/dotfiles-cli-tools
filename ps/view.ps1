#!/usr/bin/env pwsh
# Opens the target file in read-only mode using the configured editor.
# Usage: view.ps1 <file>

param(
    [Parameter(ValueFromRemainingArguments = $true, Mandatory = $true)]
    [string[]]$Paths
)

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$editor = $env:EDITOR
if (-not $editor -or $editor.Trim().Length -eq 0) {
    $editor = 'vim'
}

if ($editor -eq 'nvim') {
    & $editor '-R' @Paths
    exit $LASTEXITCODE
}

& $editor '-R' @Paths
exit $LASTEXITCODE
