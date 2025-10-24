#!/usr/bin/env pwsh
# Uses fzf to interactively select and check out a git branch.
# Usage: git-fzf-checkout.ps1

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$branches = & git branch
if ($LASTEXITCODE -ne 0) {
    Write-Error 'failed to list git branches'
    exit $LASTEXITCODE
}

if (-not $branches) {
    Write-Error 'no branches found'
    exit 1
}

$inputText = ($branches -join "`n")
$selection = $inputText | & fzf +m --height=1%
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

$selection = ($selection | Select-Object -First 1).ToString()
$branchName = $selection -replace '^\*\s*', ''
$branchName = $branchName.Trim()
if (-not $branchName) {
    Write-Error 'no branch selected'
    exit 1
}

& git checkout $branchName
exit $LASTEXITCODE
