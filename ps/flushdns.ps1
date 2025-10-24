<#
.SYNOPSIS
    Flushes the local DNS cache on supported systems.
.DESCRIPTION
    PowerShell equivalent of sh/flushdns with support for macOS, Windows, and systemd-resolved on Linux.
#>
[CmdletBinding()]
param()

if ($IsMacOS) {
    & 'sudo' 'dscacheutil' '-flushcache'
    if ($LASTEXITCODE -ne 0) {
        throw 'Failed to flush cache via dscacheutil.'
    }
    & 'sudo' 'killall' '-HUP' 'mDNSResponder'
    exit $LASTEXITCODE
}

if ($IsWindows) {
    Clear-DnsClientCache
    return
}

$systemdResolve = Get-Command -Name 'systemd-resolve' -ErrorAction SilentlyContinue
if ($systemdResolve) {
    & 'sudo' $systemdResolve.Source '--flush-caches'
    exit $LASTEXITCODE
}

$resolveCtl = Get-Command -Name 'resolvectl' -ErrorAction SilentlyContinue
if ($resolveCtl) {
    & 'sudo' $resolveCtl.Source 'flush-caches'
    exit $LASTEXITCODE
}

Write-Error 'flushdns: no supported cache flush method found'

