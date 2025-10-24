#!/usr/bin/env pwsh
# Reports npm dependencies that are not required anywhere in the repository.
# Usage: npm-unused.ps1

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$pkgPath = Join-Path (Get-Location) 'package.json'
if (-not (Test-Path -LiteralPath $pkgPath)) {
    Write-Error "can't find package.json in this folder"
    exit 1
}

$pkg = Get-Content -LiteralPath $pkgPath -Raw | ConvertFrom-Json
$deps = [System.Collections.Generic.SortedSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
foreach ($kv in @($pkg.dependencies.PSObject.Properties, $pkg.devDependencies.PSObject.Properties)) {
    foreach ($prop in $kv) {
        [void]$deps.Add($prop.Name)
    }
}

if ($deps.Count -eq 0) {
    Write-Output 'all good!'
    exit 0
}

$allGood = $true
foreach ($dep in $deps) {
    $pattern = "require(['\"']$dep"
    & git grep -q $pattern
    $code = $LASTEXITCODE
    if ($code -eq 1) {
        Write-Error "$dep not required anywhere"
        $allGood = $false
    } elseif ($code -ne 0) {
        Write-Error "git grep failed for $dep"
        exit $code
    }
}

if ($allGood) {
    Write-Output 'all good!'
} else {
    Write-Output ''
    Write-Output "note: a module can still be used even if it's not required. take care uninstalling these packages"
    exit 1
}
