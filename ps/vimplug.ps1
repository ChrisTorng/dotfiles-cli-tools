#!/usr/bin/env pwsh
# Downloads vim-plug into the appropriate autoload directory if missing and runs PlugInstall/Update commands.
# Usage: vimplug.ps1

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$cmd = $null
$neovim = Get-Command -Name nvim -ErrorAction SilentlyContinue
$vim = Get-Command -Name vim -ErrorAction SilentlyContinue
if ($neovim) {
    $cmd = $neovim.Path
} elseif ($vim) {
    $cmd = $vim.Path
} else {
    Write-Error 'neovim or vim not found'
    exit 1
}

$xdg = if ($env:XDG_CONFIG_HOME) { $env:XDG_CONFIG_HOME } else { Join-Path ([Environment]::GetFolderPath('UserProfile')) '.config' }
$plugPath = Join-Path $xdg 'nvim/autoload/plug.vim'
if (-not (Test-Path -LiteralPath $plugPath)) {
    $parent = Split-Path -Parent $plugPath
    if (-not (Test-Path -LiteralPath $parent)) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
    }
    Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' -OutFile $plugPath -UseBasicParsing
}

& $cmd '-e' '+PlugInstall' '+PlugUpgrade' '+PlugUpdate' '+PlugClean!' '+qall'
exit $LASTEXITCODE
