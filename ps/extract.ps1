<#
.SYNOPSIS
    Extracts common archive formats into appropriately named directories.
.DESCRIPTION
    PowerShell port of sh/extract supporting tar, zip, rar (macOS), gz, bz2, and xz archives.
.PARAMETER ArchivePath
    One or more archive paths to extract.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0, ValueFromRemainingArguments = $true)]
    [string[]]$ArchivePath
)

function Invoke-StrictCommand {
    param(
        [string]$Command,
        [string[]]$Arguments
    )

    & $Command @Arguments
    if ($LASTEXITCODE -ne 0) {
        throw "Command '$Command' failed with exit code $LASTEXITCODE."
    }
}

function Drop-Suffix {
    param(
        [string]$Name,
        [string[]]$Suffixes
    )

    foreach ($suffix in $Suffixes) {
        if ($Name.EndsWith($suffix, [StringComparison]::OrdinalIgnoreCase)) {
            return $Name.Substring(0, $Name.Length - $suffix.Length)
        }
    }
    return $null
}

foreach ($path in $ArchivePath) {
    $resolved = Resolve-Path -LiteralPath $path
    $item = Get-Item -LiteralPath $resolved
    $name = $item.Name

    $tarName = Drop-Suffix -Name $name -Suffixes @('.tar.gz', '.tar.bz2', '.tar.xz', '.tgz', '.tbz2', '.tar')
    if ($tarName) {
        $outDir = Join-Path -Path $item.DirectoryName -ChildPath $tarName
        if (-not (Test-Path -LiteralPath $outDir)) {
            New-Item -ItemType Directory -Path $outDir | Out-Null
        }
        Invoke-StrictCommand -Command 'tar' -Arguments @('-xf', $item.FullName, '-C', $outDir)
        continue
    }

    switch ($item.Extension.ToLowerInvariant()) {
        '.zip' {
            $outDir = Join-Path -Path $item.DirectoryName -ChildPath $name.Substring(0, $name.Length - 4)
            if (-not (Test-Path -LiteralPath $outDir)) {
                New-Item -ItemType Directory -Path $outDir | Out-Null
            }
            Invoke-StrictCommand -Command 'unzip' -Arguments @('-d', $outDir, $item.FullName)
        }
        '.rar' {
            if (-not $IsMacOS) {
                throw "Can't extract $name"
            }
            $outDir = Join-Path -Path $item.DirectoryName -ChildPath $name.Substring(0, $name.Length - 4)
            if (-not (Test-Path -LiteralPath $outDir)) {
                New-Item -ItemType Directory -Path $outDir | Out-Null
            }
            Invoke-StrictCommand -Command '/usr/bin/tar' -Arguments @('-xf', $item.FullName, '-C', $outDir)
        }
        '.gz' {
            Invoke-StrictCommand -Command 'gunzip' -Arguments @('--keep', $item.FullName)
        }
        '.bz2' {
            Invoke-StrictCommand -Command 'bunzip2' -Arguments @('--keep', $item.FullName)
        }
        '.xz' {
            Invoke-StrictCommand -Command 'unxz' -Arguments @('--keep', $item.FullName)
        }
        Default {
            throw "Can't extract $name"
        }
    }
}
