#!/usr/bin/env pwsh
# Outputs a stored snippet file from ~/.config/evanhahn-snippets.
# Usage: snippets.ps1 <name>

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [Parameter(Position = 0, Mandatory = $true)]
    [string]$Name
)

$xdg = if ($env:XDG_CONFIG_HOME) { $env:XDG_CONFIG_HOME } else { Join-Path ([Environment]::GetFolderPath('UserProfile')) '.config' }
$path = Join-Path $xdg 'evanhahn-snippets'
$file = Join-Path $path $Name

if (-not (Test-Path -LiteralPath $file)) {
    Write-Error "no snippet found at $file"
    exit 1
}

Get-Content -LiteralPath $file
