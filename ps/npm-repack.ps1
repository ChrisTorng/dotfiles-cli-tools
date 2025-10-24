#!/usr/bin/env pwsh
# Repackages an npm tarball with optimal gzip compression for size comparison.
# Usage: npm-repack.ps1 <package-name-or-directory>

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [Parameter(Position = 0, Mandatory = $true)]
    [string]$Package
)

 $packOutput = & npm pack $Package
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
$packOutput | ForEach-Object { Write-Output $_ }
$tgzName = ($packOutput | Select-Object -Last 1).Trim()
if (-not $tgzName) {
    Write-Error 'npm pack did not return a tarball name'
    exit 1
}
$tgzFile = Get-Item -LiteralPath $tgzName -ErrorAction Stop
Write-Output "$($tgzFile.Length) $($tgzFile.Name)"

$tarPath = [System.IO.Path]::ChangeExtension($tgzFile.FullName, '.tar')
$inputStream = [System.IO.File]::OpenRead($tgzFile.FullName)
try {
    $outputStream = [System.IO.File]::Create($tarPath)
    try {
        $gzip = New-Object System.IO.Compression.GZipStream($inputStream, [System.IO.Compression.CompressionMode]::Decompress)
        try {
            $gzip.CopyTo($outputStream)
        } finally {
            $gzip.Dispose()
        }
    } finally {
        $outputStream.Dispose()
    }
} finally {
    $inputStream.Dispose()
}
Remove-Item -LiteralPath $tgzFile.FullName

$zopfli = Get-Command -Name zopfli -ErrorAction SilentlyContinue
if (-not $zopfli) {
    Write-Error 'zopfli command not found'
    exit 1
}

& $zopfli.Path '--gzip' '-i1000' $tarPath
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

$gzPath = "$tarPath.gz"
$gzFile = Get-Item -LiteralPath $gzPath
Write-Output "$($gzFile.Length) $($gzFile.Name)"
