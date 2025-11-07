#!/usr/bin/env pwsh
# Converts curly quotes in the input to straight ASCII quotes.
# Usage: straightquote.ps1 < input

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$text = [Console]::In.ReadToEnd()
if ($null -eq $text) { exit 0 }
$text = $text -replace '[“”]', '"'
$text = $text -replace "[‘’]", "'"
[Console]::Out.Write($text)
