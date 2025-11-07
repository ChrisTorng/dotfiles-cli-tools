<#
.SYNOPSIS
    Transcodes a media file to several formats and keeps the smallest result.
.DESCRIPTION
    PowerShell port of sh/ffmpeg-smallest.
.PARAMETER InputFile
    Input media file.
.PARAMETER OutputFileWithoutExtension
    Base output path without extension.
.PARAMETER Extensions
    One or more output extensions to try.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$InputFile,
    [Parameter(Mandatory = $true, Position = 1)]
    [string]$OutputFileWithoutExtension,
    [Parameter(Mandatory = $true, Position = 2, ValueFromRemainingArguments = $true)]
    [string[]]$Extensions
)

$resolvedInput = Resolve-Path -LiteralPath $InputFile
$uniqueExtensions = [System.Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
foreach ($ext in $Extensions) {
    $trimmed = $ext.Trim()
    if (-not [string]::IsNullOrEmpty($trimmed)) {
        $uniqueExtensions.Add($trimmed) | Out-Null
    }
}

if ($uniqueExtensions.Count -eq 0) {
    throw 'At least one extension must be provided.'
}

$ffmpeg = Get-Command -Name ffmpeg -ErrorAction SilentlyContinue
if (-not $ffmpeg) {
    throw 'ffmpeg is not available on PATH.'
}

$tempDir = Join-Path -Path ([System.IO.Path]::GetTempPath()) -ChildPath ([Guid]::NewGuid().ToString())
New-Item -ItemType Directory -Path $tempDir | Out-Null
try {
    Write-Output ("converting to " + [string]::Join(', ', $uniqueExtensions))

    $outputFiles = @()
    foreach ($ext in $uniqueExtensions) {
        $outputFiles += Join-Path -Path $tempDir -ChildPath ("ffmpeg-smallest-conversion.$ext")
    }

    $arguments = @('-v', 'warning', '-stats', '-i', $resolvedInput.Path) + $outputFiles
    & $ffmpeg.Source @arguments
    if ($LASTEXITCODE -ne 0) {
        throw "ffmpeg failed with exit code $LASTEXITCODE"
    }

    $candidates = @([System.IO.FileInfo]::new($resolvedInput.Path))
    foreach ($file in $outputFiles) {
        $candidates += [System.IO.FileInfo]::new($file)
    }

    $smallest = $candidates | Sort-Object -Property Length | Select-Object -First 1
    if ($smallest.FullName -eq $resolvedInput.Path) {
        Write-Output 'original was smallest, renaming'
    } else {
        Write-Output ("smallest: " + $smallest.Extension)
    }

    $finalDestination = [System.IO.FileInfo]::new("$OutputFileWithoutExtension$($smallest.Extension)")
    if ($finalDestination.Directory -and -not $finalDestination.Directory.Exists) {
        $null = New-Item -ItemType Directory -Path $finalDestination.Directory.FullName
    }
    Move-Item -LiteralPath $smallest.FullName -Destination $finalDestination.FullName -Force
} finally {
    Remove-Item -LiteralPath $tempDir -Recurse -Force -ErrorAction SilentlyContinue
}
