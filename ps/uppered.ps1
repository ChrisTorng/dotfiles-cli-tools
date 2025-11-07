#!/usr/bin/env pwsh
# Converts stdin to uppercase characters.
# Usage: uppered < input

$inputText = [Console]::In.ReadToEnd()
if ($null -ne $inputText) {
    [Console]::Out.Write($inputText.ToUpperInvariant())
}
