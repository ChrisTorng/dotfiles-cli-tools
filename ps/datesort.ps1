<#
.SYNOPSIS
    Suggests moves to organize files into year-based folders inferred from filenames.
.DESCRIPTION
    PowerShell equivalent of sh/datesort.
.PARAMETER Root
    Root directory to scan.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$Root
)

$rootPath = Resolve-Path -LiteralPath $Root
$rootDirectory = Get-Item -LiteralPath $rootPath

function Get-ExpectedDirectoryName {
    param([System.IO.FileInfo]$File)
    $match = [System.Text.RegularExpressions.Regex]::Match($File.Name, '^(\d{4})[^\d]')
    if ($match.Success) {
        return $match.Groups[1].Value
    }
    return 'dateless'
}

$moves = @()
Get-ChildItem -LiteralPath $rootDirectory.FullName -File -Recurse | ForEach-Object {
    if ($_.Name.StartsWith('.')) {
        return
    }
    $expectedDirName = Get-ExpectedDirectoryName -File $_
    $expectedDirPath = Join-Path -Path $rootDirectory.FullName -ChildPath $expectedDirName
    $actualDirPath = $_.DirectoryName
    if ([System.IO.Path]::GetFullPath($expectedDirPath) -ne [System.IO.Path]::GetFullPath($actualDirPath)) {
        $targetPath = Join-Path -Path $expectedDirPath -ChildPath $_.Name
        $moves += [PSCustomObject]@{
            Source      = $_.FullName
            Destination = $targetPath
        }
    }
}

if ($moves.Count -eq 0) {
    return
}

foreach ($move in $moves) {
    $relativeSource = [System.IO.Path]::GetRelativePath($rootDirectory.FullName, $move.Source)
    $relativeDestination = [System.IO.Path]::GetRelativePath($rootDirectory.FullName, $move.Destination)
    Write-Output "$relativeSource → $relativeDestination"
}

Write-Host
$confirmation = Read-Host "Type \"ok\" to do this"
if ($confirmation -ne 'ok') {
    exit 1
}

foreach ($move in $moves) {
    $destinationDirectory = Split-Path -Path $move.Destination -Parent
    if (-not (Test-Path -LiteralPath $destinationDirectory)) {
        New-Item -ItemType Directory -Path $destinationDirectory | Out-Null
    }
    Move-Item -LiteralPath $move.Source -Destination $move.Destination
}
