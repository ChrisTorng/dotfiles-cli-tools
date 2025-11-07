#!/usr/bin/env pwsh
# Reports your local and/or public IP address.
# Usage: myip.ps1 <local|l|global|g|gl|lg...>

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [Parameter(Mandatory = $true, ValueFromRemainingArguments = $true)]
    [string[]]$Desired
)

$set = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
foreach ($item in $Desired) { [void]$set.Add($item) }
$wantsBoth = $set.Contains('gl') -or $set.Contains('lg')
$wantsLocal = $wantsBoth -or $set.Contains('local') -or $set.Contains('l')
$wantsGlobal = $wantsBoth -or $set.Contains('global') -or $set.Contains('g')

if (-not $wantsLocal -and -not $wantsGlobal) {
    Write-Error 'must specify local and/or global'
    exit 1
}

function Get-LocalIp {
    $host = [System.Net.Dns]::GetHostName()
    $addresses = [System.Net.Dns]::GetHostAddresses($host) |
        Where-Object { $_.AddressFamily -eq [System.Net.Sockets.AddressFamily]::InterNetwork -and
            $_.IPAddressToString -ne '127.0.0.1' }
    $addr = $addresses | Select-Object -First 1
    if (-not $addr) { return 'no local ipv4 found' }
    return $addr.ToString()
}

function Get-GlobalIp {
    $client = [System.Net.Http.HttpClient]::new()
    try {
        $response = $client.GetAsync('https://icanhazip.com/').GetAwaiter().GetResult()
        if (-not $response.IsSuccessStatusCode) {
            return "$([int]$response.StatusCode) error from upstream"
        }
        return ($response.Content.ReadAsStringAsync().GetAwaiter().GetResult()).Trim()
    } finally {
        $client.Dispose()
    }
}

if ($wantsLocal -and $wantsGlobal) {
    Write-Output "local: $(Get-LocalIp)"
    Write-Output "global: $(Get-GlobalIp)"
} elseif ($wantsLocal) {
    Write-Output (Get-LocalIp)
} elseif ($wantsGlobal) {
    Write-Output (Get-GlobalIp)
}
