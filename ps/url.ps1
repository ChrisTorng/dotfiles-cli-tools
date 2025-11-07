#!/usr/bin/env pwsh
# Parses a URL into its component parts and prints them.
# Usage: url.ps1 <url>

param(
    [Parameter(Position = 0, Mandatory = $true)]
    [string]$Url
)

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

try {
    $uri = [System.Uri]::new($Url)
} catch {
    Write-Error 'invalid URL'
    exit 1
}

Write-Output "original: $Url"
Write-Output "protocol: $($uri.Scheme)"

if ($uri.UserInfo) {
    $userInfo = $uri.UserInfo.Split(':', 2)
    if ($userInfo.Length -ge 1 -and $userInfo[0]) {
        Write-Output "username: $($userInfo[0])"
    }
    if ($userInfo.Length -eq 2 -and $userInfo[1]) {
        Write-Output "password: $($userInfo[1])"
    }
}

if ($uri.Host) {
    Write-Output "hostname: $($uri.Host)"
}

if (-not $uri.IsDefaultPort) {
    Write-Output "port: $($uri.Port)"
}

if ($uri.AbsolutePath -and $uri.AbsolutePath -ne '/') {
    Write-Output "path: $($uri.AbsolutePath)"
}

if ($uri.Query) {
    $query = $uri.Query.TrimStart('?')
    if ($query) {
        Write-Output "query: $query"
        try {
            Add-Type -AssemblyName System.Web
        } catch { }
        $collection = [System.Web.HttpUtility]::ParseQueryString($query)
        foreach ($key in $collection.Keys) {
            $value = $collection[$key]
            Write-Output "- $key $value"
        }
    }
}

if ($uri.Fragment) {
    Write-Output "hash: $($uri.Fragment.TrimStart('#'))"
}
