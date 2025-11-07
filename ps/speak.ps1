#!/usr/bin/env pwsh
# Speaks Markdown input aloud using say or espeak-ng if available.
# Usage: speak.ps1 < markdown

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$text = [Console]::In.ReadToEnd()
if (-not $text) {
    exit 0
}

$pandoc = Get-Command -Name pandoc -ErrorAction SilentlyContinue
if (-not $pandoc) {
    Write-Error 'pandoc not found'
    exit 1
}

$tempFile = [System.IO.Path]::GetTempFileName()
Set-Content -LiteralPath $tempFile -Value $text -Encoding UTF8
$pandocOutput = & $pandoc.Path -f 'commonmark' -t 'plain' '--wrap=preserve' $tempFile
Remove-Item -LiteralPath $tempFile -Force

$say = Get-Command -Name say -ErrorAction SilentlyContinue
if ($say) {
    $pandocOutput | & $say.Path
    exit $LASTEXITCODE
}

$espeak = Get-Command -Name 'espeak-ng' -ErrorAction SilentlyContinue
if ($espeak) {
    $pandocOutput | & $espeak.Path
    exit $LASTEXITCODE
}

Write-Error "couldn't find any TTS program"
exit 1
