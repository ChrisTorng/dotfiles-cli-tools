#!/usr/bin/env pwsh
# Streams audio-only playback via mpv, deferring to yt-dlp for URLs.
# Usage: tunes.ps1 <urls...>

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [Parameter(ValueFromRemainingArguments = $true, Mandatory = $true)]
    [string[]]$Urls
)

$cmd = Get-Command -Name mpv -ErrorAction SilentlyContinue
if (-not $cmd) {
    Write-Error 'mpv not found'
    exit 1
}

$arguments = @('--no-video', '--ytdl-format=worstaudio') + $Urls
& $cmd.Path @arguments
exit $LASTEXITCODE
