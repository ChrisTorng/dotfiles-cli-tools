<#
.SYNOPSIS
    Creates a temporary file path, prints it without a trailing newline, and copies it to the clipboard.
.DESCRIPTION
    PowerShell port of sh/cptmp.
#>
[CmdletBinding()]
param()

$path = [System.IO.Path]::GetTempFileName()
[Console]::Write($path)

$copyScript = Join-Path -Path $PSScriptRoot -ChildPath 'copy.ps1'
if (Test-Path -LiteralPath $copyScript) {
    & $copyScript -Path $path | Out-Null
}
