#!/usr/bin/env pwsh
# Updates package.json dependencies to their latest versions.
# Usage: npm-update-dependencies.ps1

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$pkgPath = Join-Path (Get-Location) 'package.json'
if (-not (Test-Path -LiteralPath $pkgPath)) {
    Write-Error "can't find package.json in this folder"
    exit 1
}

$pkg = Get-Content -LiteralPath $pkgPath -Raw | ConvertFrom-Json
$deps = @()
if ($pkg.PSObject.Properties.Name -contains 'dependencies' -and $pkg.dependencies) {
    foreach ($prop in $pkg.dependencies.PSObject.Properties) {
        $deps += "$($prop.Name)@latest"
    }
}

if (-not $deps) {
    Write-Output 'no dependencies to update'
    exit 0
}

& npm install --save @deps
exit $LASTEXITCODE
