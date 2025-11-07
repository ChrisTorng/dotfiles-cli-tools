<#
.SYNOPSIS
    Recursively removes .DS_Store files in the current directory tree.
.DESCRIPTION
    PowerShell port of sh/ds-destroy.
#>
[CmdletBinding()]
param()

Get-ChildItem -LiteralPath . -Recurse -Force -Filter '.DS_Store' | ForEach-Object {
    Remove-Item -LiteralPath $_.FullName -Force
}
