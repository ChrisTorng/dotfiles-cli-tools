<#
.SYNOPSIS
    Runs git with the provided arguments, defaulting to git status.
.DESCRIPTION
    PowerShell port of sh/g.
#>
[CmdletBinding()]
param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$Arguments
)

$git = Get-Command -Name git -ErrorAction SilentlyContinue
if (-not $git) {
    throw 'git is not available on PATH.'
}

if (-not $Arguments -or $Arguments.Count -eq 0) {
    & $git.Source 'status'
} else {
    & $git.Source @Arguments
}
exit $LASTEXITCODE
