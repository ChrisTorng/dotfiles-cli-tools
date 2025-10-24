#!/usr/bin/env pwsh
# Puts the computer to sleep using macOS, Linux, or Windows commands.
# Usage: sleepybear.ps1

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$platform = [System.Runtime.InteropServices.RuntimeInformation]::OSDescription
$IsWindows = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)
$IsMac = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::OSX)

if ($IsMac) {
    & /usr/bin/osascript -e 'tell application "System Events" to sleep'
    exit $LASTEXITCODE
}

if ($IsWindows) {
    & rundll32.exe powrprof.dll,SetSuspendState Sleep
    exit $LASTEXITCODE
}

$systemctl = Get-Command -Name systemctl -ErrorAction SilentlyContinue
if ($systemctl) {
    & $systemctl.Path 'suspend'
    exit $LASTEXITCODE
}

Write-Error 'no known sleep method for this platform'
exit 1
