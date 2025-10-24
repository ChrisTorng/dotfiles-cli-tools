<#
.SYNOPSIS
    Prints unique file extensions from newline-delimited paths on stdin.
.DESCRIPTION
    PowerShell port of sh/extensions.
#>
[CmdletBinding()]
param()

$extensionsSeen = [System.Collections.Generic.HashSet[string]]::new()

while (($line = [Console]::In.ReadLine()) -ne $null) {
    $trimmed = $line.Trim()
    if ([string]::IsNullOrEmpty($trimmed)) {
        continue
    }
    $extension = [System.IO.Path]::GetExtension($trimmed)
    if ($extension.Length -gt 1 -and $extensionsSeen.Add($extension)) {
        Write-Output $extension
    }
}
