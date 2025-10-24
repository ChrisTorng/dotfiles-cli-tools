#!/usr/bin/env pwsh
# Runs tree and highlights matches for a pattern within a directory.
# Usage: treefind.ps1 [pattern] [directory]

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$tree = Get-Command -Name tree -ErrorAction SilentlyContinue
if (-not $tree) {
    Write-Error 'tree command not found'
    exit 1
}

switch ($args.Count) {
    0 { & $tree.Path '.'; exit $LASTEXITCODE }
    1 {
        $what = $args[0]
        $where = (Get-Location).Path
    }
    2 {
        $what = $args[0]
        $where = $args[1]
    }
    default {
        Write-Error 'too many arguments'
        exit 1
    }
}

$arguments = @('--prune', '--matchdirs')
if ($what -notmatch '[A-Z]') {
    $arguments += '--ignore-case'
}
$arguments += '-P'
$arguments += $what
$arguments += $where

& $tree.Path @arguments
exit $LASTEXITCODE
