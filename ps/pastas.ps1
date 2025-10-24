#!/usr/bin/env pwsh
# Continuously prints clipboard changes until interrupted.
# Usage: pastas.ps1

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$pastaScript = Join-Path $PSScriptRoot 'pasta.ps1'
$lastValue = $null

try {
    while ($true) {
        $value = (& $pastaScript) -join [Environment]::NewLine
        if ($lastValue -ne $value) {
            Write-Output $value
            $lastValue = $value
        }
        Start-Sleep -Milliseconds 100
    }
} catch [System.Management.Automation.PipelineStoppedException] {
} catch [System.OperationCanceledException] {
}
