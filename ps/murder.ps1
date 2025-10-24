#!/usr/bin/env pwsh
# Interactively kills processes by PID, name, or listening port with escalating signals.
# Usage: murder.ps1 <pid|:port|name> [more...]

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [Parameter(Mandatory = $true, ValueFromRemainingArguments = $true)]
    [string[]]$Targets
)

$IsWindows = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)

$UnixSignals = @(
    @{ Code = 15; Wait = 3 },
    @{ Code = 2;  Wait = 3 },
    @{ Code = 1;  Wait = 4 },
    @{ Code = 9;  Wait = 0 }
)

function Test-ProcessRunning {
    param([int]$Pid)
    try {
        $null = Get-Process -Id $Pid -ErrorAction Stop
        return $true
    } catch {
        return $false
    }
}

function Send-UnixSignal {
    param([int]$Pid, [int]$Signal)
    & kill "-$Signal" $Pid 2>$null | Out-Null
}

function Invoke-MurderPid {
    param([int]$Pid)
    if ($IsWindows) {
        if (-not (Test-ProcessRunning -Pid $Pid)) { return }
        Stop-Process -Id $Pid -ErrorAction SilentlyContinue
        Start-Sleep -Milliseconds 500
        if (Test-ProcessRunning -Pid $Pid) {
            Start-Sleep -Seconds 3
        }
        if (Test-ProcessRunning -Pid $Pid) {
            Stop-Process -Id $Pid -Force -ErrorAction SilentlyContinue
        }
        return
    }

    foreach ($signal in $UnixSignals) {
        if (-not (Test-ProcessRunning -Pid $Pid)) { break }
        Send-UnixSignal -Pid $Pid -Signal $signal.Code
        Start-Sleep -Milliseconds 500
        if ($signal.Wait -gt 0 -and (Test-ProcessRunning -Pid $Pid)) {
            Start-Sleep -Seconds $signal.Wait
        }
    }
}

function Read-Confirmation {
    param([string]$Prompt)
    $response = Read-Host $Prompt
    if (-not $response) { return $false }
    return @('y', 'yes', 'yas') -contains $response.Trim().ToLowerInvariant()
}

function Get-CommandLine {
    param([int]$Pid)
    if ($IsWindows) {
        try {
            $proc = Get-CimInstance -ClassName Win32_Process -Filter "ProcessId=$Pid" -ErrorAction Stop
            if ($proc.CommandLine) { return $proc.CommandLine }
        } catch { }
        return (Get-Process -Id $Pid -ErrorAction SilentlyContinue).Path
    }

    $path = "/proc/$Pid/cmdline"
    if (Test-Path -LiteralPath $path) {
        try {
            $raw = Get-Content -LiteralPath $path -Raw -ErrorAction Stop
            $clean = $raw -replace "`0", ' '
            return $clean.Trim()
        } catch { }
    }
    return (Get-Process -Id $Pid -ErrorAction SilentlyContinue).ProcessName
}

function Get-ProcessesMatching {
    param([string]$Term)
    $needle = $Term.ToLowerInvariant()
    $results = @()
    foreach ($proc in [System.Diagnostics.Process]::GetProcesses()) {
        if ($proc.Id -eq $PID) { continue }
        $description = $null
        try {
            $description = Get-CommandLine -Pid $proc.Id
        } catch {
            $description = $proc.ProcessName
        }
        if (-not $description) { $description = $proc.ProcessName }
        if ($description.ToLowerInvariant().Contains($needle)) {
            $results += [PSCustomObject]@{ Id = $proc.Id; Description = $description }
        }
    }
    return $results
}

function Get-PortPids {
    param([int]$Port)
    $pids = @()
    if ($IsWindows) {
        try {
            $connections = Get-NetTCPConnection -State Listen -LocalPort $Port -ErrorAction Stop
            $pids += $connections | Select-Object -ExpandProperty OwningProcess
        } catch { }
    } else {
        $lsof = Get-Command -Name lsof -ErrorAction SilentlyContinue
        if ($lsof) {
            $output = & $lsof.Path '-nP' '-i' ":$Port" 2>$null
            foreach ($line in $output | Select-Object -Skip 1) {
                $parts = $line -split '\s+'
                if ($parts.Length -gt 1 -and $parts[1] -match '^[0-9]+$') {
                    $pids += [int]$parts[1]
                }
            }
        }
    }
    return $pids | Sort-Object -Unique
}

function Murder-Names {
    param([string]$Name)
    while ($true) {
        $shouldLoop = $false
        $processes = Get-ProcessesMatching -Term $Name
        foreach ($proc in $processes) {
            if (Read-Confirmation -Prompt "murder $($proc.Description) (pid $($proc.Id))?") {
                Invoke-MurderPid -Pid $proc.Id
                $shouldLoop = $true
                break
            }
        }
        if (-not $shouldLoop) { break }
    }
}

function Murder-Port {
    param([int]$Port)
    while ($true) {
        $shouldLoop = $false
        $pids = Get-PortPids -Port $Port
        foreach ($pid in $pids) {
            $desc = Get-CommandLine -Pid $pid
            if (Read-Confirmation -Prompt "murder $desc (pid $pid)?") {
                Invoke-MurderPid -Pid $pid
                $shouldLoop = $true
                break
            }
        }
        if (-not $shouldLoop) { break }
    }
}

foreach ($target in $Targets) {
    if ($target -match '^[0-9]+$') {
        Invoke-MurderPid -Pid [int]$target
    } elseif ($target.StartsWith(':') -and $target.Substring(1) -match '^[0-9]+$') {
        Murder-Port -Port [int]$target.Substring(1)
    } else {
        Murder-Names -Name $target
    }
}
