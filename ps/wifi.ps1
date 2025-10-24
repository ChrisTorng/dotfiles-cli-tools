#!/usr/bin/env pwsh
# Provides simple Wi-Fi status, toggling, and join helpers (primarily for macOS).
# Usage: wifi.ps1 <status|list|join|off|on|toggle|help> [args...]

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$IsMac = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::OSX)
$airport = '/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
$rfkill = 'rfkill'

function Show-Help {
    Write-Output 'wifi status                       print wifi status'
    Write-Output 'wifi list                         list networks'
    Write-Output 'wifi join [username] [password]   join a network'
    Write-Output 'wifi off                          turn off wifi'
    Write-Output 'wifi on                           turn on wifi'
    Write-Output 'wifi toggle                       turn off wifi, then on'
    Write-Output 'wifi help                         show this message'
}

function Is-WifiEnabled {
    if ($IsMac) {
        $result = & $airport '-I'
        if ($LASTEXITCODE -ne 0) { return $false }
        return -not ($result -match 'AirPort: Off')
    }
    Write-Error 'not supported yet'
    exit 1
}

function Ensure-WifiEnabled {
    if (-not (Is-WifiEnabled)) {
        Write-Error 'wifi is disabled; cannot perform this operation'
        exit 1
    }
}

if ($args.Count -eq 0 -or $args[0] -eq 'help') {
    Show-Help
    exit 0
}

switch ($args[0]) {
    'status' {
        if ($IsMac) {
            if (Is-WifiEnabled) {
                Write-Output 'wifi is enabled'
                Write-Output 'not sure how to parse the rest yet'
            } else {
                Write-Output 'wifi is disabled'
            }
        } else {
            Write-Error 'not supported yet'
            exit 1
        }
    }
    'list' {
        if ($IsMac) {
            Ensure-WifiEnabled
            & $airport '-s'
            exit $LASTEXITCODE
        }
        Write-Error 'not supported yet'
        exit 1
    }
    'join' {
        if ($IsMac) {
            Ensure-WifiEnabled
            if ($args.Count -lt 3) {
                Write-Error 'usage: wifi join [username] [password]'
                exit 1
            }
            & 'networksetup' '-setairportnetwork' 'en0' $args[1] $args[2]
            exit $LASTEXITCODE
        }
        Write-Error 'not supported yet'
        exit 1
    }
    'off' {
        if ($IsMac) {
            & 'networksetup' '-setairportpower' 'en0' 'off'
            exit $LASTEXITCODE
        }
        $rf = Get-Command -Name $rfkill -ErrorAction SilentlyContinue
        if (-not $rf) { Write-Error 'rfkill not found'; exit 1 }
        & $rf.Path 'block' 'wifi'
        exit $LASTEXITCODE
    }
    'on' {
        if ($IsMac) {
            & 'networksetup' '-setairportpower' 'en0' 'on'
            exit $LASTEXITCODE
        }
        $rf = Get-Command -Name $rfkill -ErrorAction SilentlyContinue
        if (-not $rf) { Write-Error 'rfkill not found'; exit 1 }
        & $rf.Path 'unblock' 'wifi'
        exit $LASTEXITCODE
    }
    'toggle' {
        if ($IsMac) {
            & 'networksetup' '-setairportpower' 'en0' 'off'
            Start-Sleep -Seconds 1
            & 'networksetup' '-setairportpower' 'en0' 'on'
            exit $LASTEXITCODE
        }
        & 'sudo' 'systemctl' 'restart' 'wpa_supplicant'
        exit $LASTEXITCODE
    }
    Default {
        Write-Error "I don't know about that command"
        exit 1
    }
}
