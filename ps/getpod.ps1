<#
.SYNOPSIS
    Downloads audio from online sources via yt-dlp with podcast-friendly settings.
.DESCRIPTION
    PowerShell port of sh/getpod.
.PARAMETER Arguments
    Additional arguments passed to yt-dlp.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0, ValueFromRemainingArguments = $true)]
    [string[]]$Arguments
)

$ytDlp = Get-Command -Name yt-dlp -ErrorAction SilentlyContinue
if (-not $ytDlp) {
    throw 'yt-dlp is not available on PATH.'
}

$baseArgs = @(
    '--embed-chapters',
    '--embed-thumbnail',
    '--extract-audio',
    '--audio-format', 'mp3',
    '-f', 'worstaudio'
)

& $ytDlp.Source @baseArgs @Arguments
exit $LASTEXITCODE
