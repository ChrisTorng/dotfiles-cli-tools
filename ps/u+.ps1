#!/usr/bin/env pwsh
# Prints the Unicode character and name for a hexadecimal code point.
# Usage: u+.ps1 <hex-codepoint>

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [Parameter(Position = 0, Mandatory = $true)]
    [string]$HexNumber
)

try {
    $codePoint = [Convert]::ToInt32($HexNumber, 16)
} catch {
    Write-Error 'invalid hexadecimal code point'
    exit 1
}

if ($codePoint -lt 0 -or $codePoint -gt 0x10FFFF) {
    Write-Error 'code point out of range'
    exit 1
}

try {
    $rune = [System.Text.Rune]::new($codePoint)
    $character = $rune.ToString()
} catch {
    Write-Error 'invalid Unicode code point'
    exit 1
}

$name = $null
try {
    $name = [System.Text.Unicode.UnicodeInfo]::GetName($codePoint)
} catch {
    $python = Get-Command -Name python3 -ErrorAction SilentlyContinue
    if ($python) {
        $name = (& $python.Path '-c' "import unicodedata, sys; print(unicodedata.name(chr(int(sys.argv[1]))))" $codePoint).Trim()
    }
}

if (-not $name) {
    $name = 'name unavailable'
}

Write-Output $character
Write-Output $name
