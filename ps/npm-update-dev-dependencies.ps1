#!/usr/bin/env pwsh
# Updates package.json devDependencies to their latest versions.
# Usage: npm-update-dev-dependencies.ps1

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$pkgPath = Join-Path (Get-Location) 'package.json'
if (-not (Test-Path -LiteralPath $pkgPath)) {
    Write-Error "can't find package.json in this folder"
    exit 1
}

$pkg = Get-Content -LiteralPath $pkgPath -Raw | ConvertFrom-Json
$deps = @()
if ($pkg.PSObject.Properties.Name -contains 'devDependencies' -and $pkg.devDependencies) {
    foreach ($prop in $pkg.devDependencies.PSObject.Properties) {
        $deps += "$($prop.Name)@latest"
    }
}

if (-not $deps) {
    Write-Output 'no devDependencies to update'
    exit 0
}

& npm install --save-dev @deps
exit $LASTEXITCODE
