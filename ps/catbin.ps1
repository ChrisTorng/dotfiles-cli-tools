<#
.SYNOPSIS
    Shows the contents of an executable found in PATH using bat if available, otherwise streams bytes to stdout.
.DESCRIPTION
    PowerShell equivalent of sh/catbin.
.PARAMETER Name
    Name of the command to display.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$Name
)

try {
    $commandInfo = Get-Command -Name $Name -ErrorAction Stop
} catch {
    Write-Error "Command '$Name' not found in PATH." -ErrorAction Stop
}

$targetPath = $commandInfo.Source
$bat = Get-Command -Name bat -ErrorAction SilentlyContinue
if ($bat) {
    & $bat.Source $targetPath
    return
}

$cat = Get-Command -Name cat -ErrorAction SilentlyContinue
if ($cat -and $cat.CommandType -eq 'Application') {
    & $cat.Source $targetPath
    return
}

$inputStream = [System.IO.File]::OpenRead($targetPath)
try {
    $output = [Console]::OpenStandardOutput()
    $buffer = New-Object byte[] 8192
    while (($read = $inputStream.Read($buffer, 0, $buffer.Length)) -gt 0) {
        $output.Write($buffer, 0, $read)
    }
    $output.Flush()
} finally {
    $inputStream.Dispose()
}
