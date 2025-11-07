#!/usr/bin/env pwsh
# Updates Homebrew and Flatpak packages if the tools are available.
# Usage: upup.ps1

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$brew = Get-Command -Name brew -ErrorAction SilentlyContinue
if ($brew) {
    & $brew.Path 'update'
    & $brew.Path 'upgrade'
    & $brew.Path 'cleanup'
}

$flatpak = Get-Command -Name flatpak -ErrorAction SilentlyContinue
if ($flatpak) {
    & $flatpak.Path 'update' '--assumeyes'
}
