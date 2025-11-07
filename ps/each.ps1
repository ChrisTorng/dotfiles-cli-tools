<#
.SYNOPSIS
    Runs a PowerShell command for each line of stdin by replacing {} in the template.
.DESCRIPTION
    PowerShell port of sh/each. Reads stdin, splits on newlines, replaces {} with the single-quoted line, and executes
    the resulting command using Invoke-Expression.
.PARAMETER Command
    Command template containing at least one {} placeholder.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$Command
)

if (-not $Command.Contains('{}')) {
    throw 'Command must contain at least one {} placeholder.'
}

$inputText = [Console]::In.ReadToEnd()
if ([string]::IsNullOrEmpty($inputText)) {
    return
}

$lines = $inputText -split "`r?`n"
foreach ($line in $lines) {
    if ([string]::IsNullOrEmpty($line)) {
        continue
    }
    $escaped = $line.Replace("'", "''")
    $commandToRun = $Command -replace '\{\}', "'$escaped'"
    try {
        Invoke-Expression -Command $commandToRun
    } catch {
        Write-Error $_
        exit 1
    }
    if ($LASTEXITCODE -ne 0) {
        exit $LASTEXITCODE
    }
}
