<#
.SYNOPSIS
    Copies the current working directory path to the clipboard.
.DESCRIPTION
    PowerShell version of sh/cpwd.
#>
[CmdletBinding()]
param()

$path = (Get-Location).Path
$copyScript = Join-Path -Path $PSScriptRoot -ChildPath 'copy.ps1'
if (Test-Path -LiteralPath $copyScript) {
    & $copyScript -Path $path | Out-Null
} elseif (Get-Command -Name Set-Clipboard -ErrorAction SilentlyContinue) {
    Set-Clipboard -Value $path
} else {
    Write-Output $path
}
