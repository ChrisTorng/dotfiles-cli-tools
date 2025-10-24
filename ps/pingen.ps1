#!/usr/bin/env pwsh
# Generates a random numeric PIN of the requested length.
# Usage: pingen [length]

param(
    [int]$Length = 6
)

if ($Length -le 0) {
    throw "Length must be positive."
}

$buffer = New-Object System.Byte[] 1
$builder = New-Object System.Text.StringBuilder

for ($i = 0; $i -lt $Length; $i++) {
    [System.Security.Cryptography.RandomNumberGenerator]::Fill($buffer)
    $digit = $buffer[0] % 10
    [void]$builder.Append($digit.ToString())
}

[Console]::Out.Write($builder.ToString())
