#!/usr/bin/env pwsh
# Streams audio-only playback via mpv, deferring to yt-dlp for URLs.
# Usage: tunes.ps1 <urls...>

param(
    [Parameter(ValueFromRemainingArguments = $true, Mandatory = $true)]
    [string[]]$Urls
)

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$cmd = Get-Command -Name mpv -ErrorAction SilentlyContinue
if (-not $cmd) {
    Write-Error 'mpv not found'
    exit 1
}

$arguments = @('--no-video', '--ytdl-format=worstaudio')
if ($env:MPV_NO_AUDIO -eq '1') {
    $arguments += '--ao=null'
}
$arguments += $Urls
& $cmd.Path @arguments
exit $LASTEXITCODE
