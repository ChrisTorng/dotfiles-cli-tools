#!/usr/bin/env pwsh
# Counts the number of characters in the provided arguments.
# Usage: length <text...>

param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$Text
)

$joined = if ($Text) { [string]::Join(' ', $Text) } else { '' }
Write-Output $joined.Length
