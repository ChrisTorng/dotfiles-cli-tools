#!/usr/bin/env pwsh
# Starts a simple HTTP server in the current directory on the chosen port.
# Usage: serveit.ps1 [port]

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [Parameter(Position = 0)]
    [int]$Port = 8000
)

function Invoke-IfAvailable {
    param([string]$Command, [string[]]$Arguments)
    $cmd = Get-Command -Name $Command -ErrorAction SilentlyContinue
    if ($cmd) {
        & $cmd.Path @Arguments
        exit $LASTEXITCODE
    }
}

Invoke-IfAvailable -Command 'php' -Arguments @('-S', "localhost:$Port")
Invoke-IfAvailable -Command 'python3' -Arguments @('-m', 'http.server', "$Port")

$python = Get-Command -Name 'python' -ErrorAction SilentlyContinue
if ($python) {
    $major = (& $python.Path '-c' 'import sys; print(sys.version_info[0])').Trim()
    if ($major -eq '3') {
        & $python.Path '-m' 'http.server' "$Port"
    } else {
        & $python.Path '-m' 'SimpleHTTPServer' "$Port"
    }
    exit $LASTEXITCODE
}

Invoke-IfAvailable -Command 'ruby' -Arguments @('-run', '-e', 'httpd', '.', '-p', "$Port")

Write-Error 'unable to start HTTP server'
exit 1
