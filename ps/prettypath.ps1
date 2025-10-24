#!/usr/bin/env pwsh
# Prints the PATH environment variable one directory per line.
# Usage: prettypath

$separator = [System.IO.Path]::PathSeparator
$pathValue = $Env:PATH
if ($null -eq $pathValue) {
    return
}

$pathValue.Split($separator, [System.StringSplitOptions]::RemoveEmptyEntries) | ForEach-Object {
    Write-Output $_
}
