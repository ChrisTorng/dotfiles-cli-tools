#!/usr/bin/env pwsh
# Plays a named sound effect from the configured effects directory using mpv.
# Usage: sfx.ps1 <effect-name>

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [Parameter(Position = 0, Mandatory = $true)]
    [string]$Effect
)

$xdg = if ($env:XDG_CONFIG_HOME) { $env:XDG_CONFIG_HOME } else { Join-Path ([Environment]::GetFolderPath('UserProfile')) '.config' }
$effectPath = Join-Path $xdg 'evanhahn-sfx'
$file = Join-Path $effectPath "$Effect.ogg"
if (-not (Test-Path -LiteralPath $file)) {
    Write-Error "sound effect not found: $file"
    exit 1
}

$cmd = Get-Command -Name mpv -ErrorAction SilentlyContinue
if (-not $cmd) {
    Write-Error 'mpv not found'
    exit 1
}

Start-Process -FilePath $cmd.Path -ArgumentList @('--really-quiet', '--no-video', $file) | Out-Null
