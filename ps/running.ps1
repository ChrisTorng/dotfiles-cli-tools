#!/usr/bin/env pwsh
# Lists running processes, optionally filtering by a case-insensitive pattern.
# Usage: running.ps1 [pattern]

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$Pattern
)

$IsWindows = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)
$patternString = if ($Pattern) { [string]::Join(' ', $Pattern) } else { $null }

function Get-CommandLine {
    param([System.Diagnostics.Process]$Process)
    if ($IsWindows) {
        try {
            $info = Get-CimInstance -ClassName Win32_Process -Filter "ProcessId=$($Process.Id)" -ErrorAction Stop
            if ($info.CommandLine) { return $info.CommandLine }
        } catch { }
        return $Process.ProcessName
    }
    $path = "/proc/$($Process.Id)/cmdline"
    if (Test-Path -LiteralPath $path) {
        try {
            $raw = Get-Content -LiteralPath $path -Raw -ErrorAction Stop
            $text = $raw -replace "`0", ' '
            if ($text.Trim().Length -gt 0) { return $text.Trim() }
        } catch { }
    }
    return $Process.ProcessName
}

$processes = @()
foreach ($proc in [System.Diagnostics.Process]::GetProcesses()) {
    try {
        $desc = Get-CommandLine -Process $proc
        if (-not $desc) { $desc = $proc.ProcessName }
        if ($patternString) {
            if ($desc -notmatch [System.Text.RegularExpressions.Regex]::Escape($patternString)) { continue }
        }
        $processes += [PSCustomObject]@{ Id = $proc.Id; Description = $desc }
    } catch {
        continue
    }
}

$processes = $processes | Sort-Object Id
$magenta = if ($PSStyle) { $PSStyle.Foreground.Magenta } else { "`e[35m" }
$reset = if ($PSStyle) { $PSStyle.Reset } else { "`e[0m" }
foreach ($proc in $processes) {
    $pidText = ('{0,5}' -f $proc.Id)
    if ($magenta) {
        $pidText = "$magenta$pidText$reset"
    }
    Write-Output "$pidText $($proc.Description)"
}
