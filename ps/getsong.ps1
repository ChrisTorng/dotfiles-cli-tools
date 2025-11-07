<#
.SYNOPSIS
    Fetches the best available audio stream via yt-dlp.
.DESCRIPTION
    PowerShell port of sh/getsong.
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

$baseArgs = @('-f', 'bestaudio', '-o', '%(title)s.%(ext)s')
& $ytDlp.Source @baseArgs @Arguments
exit $LASTEXITCODE
