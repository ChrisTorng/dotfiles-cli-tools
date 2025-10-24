#!/usr/bin/env pwsh
# Runs every theme script in ~/.config/evanhahn-theme-scripts.d with the given arguments.
# Usage: theme.ps1 [args...]

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$xdg = if ($env:XDG_CONFIG_HOME) { $env:XDG_CONFIG_HOME } else { Join-Path ([Environment]::GetFolderPath('UserProfile')) '.config' }
$scriptsDir = Join-Path $xdg 'evanhahn-theme-scripts.d'

if (-not (Test-Path -LiteralPath $scriptsDir)) {
    exit 0
}

Get-ChildItem -Path $scriptsDir -File | Sort-Object Name | ForEach-Object {
    $displayArgs = if ($args) { ($args -join ' ') } else { '' }
    $line = ($_.FullName + ' ' + $displayArgs).Trim()
    Write-Output $line
    & $_.FullName @args
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}
