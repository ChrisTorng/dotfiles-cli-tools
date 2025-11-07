<#
.SYNOPSIS
    Shortcut for grep that forwards all arguments.
.DESCRIPTION
    PowerShell port of sh/f. Attempts to use grep if available.
.PARAMETER Arguments
    Arguments to forward to grep.
#>
[CmdletBinding()]
param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$Arguments
)

$grep = Get-Command -Name grep -ErrorAction SilentlyContinue
if (-not $grep) {
    throw 'grep is not available on PATH.'
}

& $grep.Source @Arguments
exit $LASTEXITCODE
