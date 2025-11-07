#!/usr/bin/env pwsh
# Pings duckduckgo.com once to check connectivity.
# Usage: pingbing.ps1

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$host = 'duckduckgo.com'
$IsWindows = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)

if ($IsWindows) {
    & ping -n 1 $host
} else {
    & ping -c 1 $host
}
exit $LASTEXITCODE
