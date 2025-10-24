#!/usr/bin/env pwsh
# Creates an executable bash script template at the given path and opens it in $env:EDITOR.
# Usage: mksh.ps1 <path>

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [Parameter(Position = 0, Mandatory = $true)]
    [string]$Path
)

if (Test-Path -LiteralPath $Path) {
    Write-Error "$Path already exists"
    exit 1
}

$content = @(
    '#!/usr/bin/env bash',
    'set -e',
    'set -u',
    'set -o pipefail',
    '',
    ''
)
Set-Content -LiteralPath $Path -Value $content -Encoding UTF8

try {
    $cmd = Get-Command -Name chmod -ErrorAction Stop
    & $cmd.Path 'u+x' $Path
} catch {
    # chmod not available; ignore on platforms without it
}

$editor = $env:VISUAL
if (-not $editor -or $editor.Trim().Length -eq 0) {
    $editor = $env:EDITOR
}

if ($editor) {
    & $editor $Path
    exit $LASTEXITCODE
}
exit 0
