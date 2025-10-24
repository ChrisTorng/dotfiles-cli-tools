#!/usr/bin/env pwsh
# Fetches a web page via jina.ai and outputs Markdown-formatted content.
# Usage: url2md.ps1 <url>

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [Parameter(Position = 0, Mandatory = $true)]
    [string]$Url
)

$uri = "https://r.jina.ai/$Url"
$headers = @{
    'DNT' = '1'
    'X-Base' = 'final'
    'X-Engine' = 'direct'
    'X-Md-Em-Delimiter' = '*'
    'X-Md-Heading-Style' = 'setext'
    'X-Md-Link-Reference-Style' = 'collapsed'
    'X-Md-Link-Style' = 'referenced'
}

try {
    $response = Invoke-WebRequest -Uri $uri -Headers $headers -UseBasicParsing -ErrorAction Stop
    [Console]::Out.Write($response.Content)
} catch {
    Write-Error $_.Exception.Message
    exit 1
}
