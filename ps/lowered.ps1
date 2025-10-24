#!/usr/bin/env pwsh
# Converts stdin to lowercase characters.
# Usage: lowered < input

$inputText = [Console]::In.ReadToEnd()
if ($null -ne $inputText) {
    [Console]::Out.Write($inputText.ToLowerInvariant())
}
