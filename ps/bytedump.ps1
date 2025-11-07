<#
.SYNOPSIS
    Outputs the bytes of a file as a delimiter-separated list, optionally in hexadecimal.
.DESCRIPTION
    PowerShell port of sh/bytedump implemented in Python.
.PARAMETER File
    File path to read.
.PARAMETER Delimiter
    Separator between byte values. Defaults to ','.
.PARAMETER Hex
    When set, prints bytes as two-digit hexadecimal values.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$File,
    [Parameter()]
    [string]$Delimiter = ",",
    [switch]$Hex
)

$resolvedPath = Resolve-Path -LiteralPath $File
$stream = [System.IO.File]::OpenRead($resolvedPath)
try {
    $buffer = New-Object byte[] 4096
    $first = $true
    while (($read = $stream.Read($buffer, 0, $buffer.Length)) -gt 0) {
        for ($i = 0; $i -lt $read; $i++) {
            if ($first) {
                $first = $false
            } else {
                [Console]::Write($Delimiter)
            }
            $value = if ($Hex.IsPresent) { "{0:X2}" -f $buffer[$i] } else { $buffer[$i].ToString() }
            [Console]::Write($value)
        }
    }
} finally {
    $stream.Dispose()
}
