#!/usr/bin/env pwsh
# Moves files to the system trash using Finder, gio, or the Windows recycle bin.
# Usage: trash.ps1 <files...>

param(
    [Parameter(ValueFromRemainingArguments = $true, Mandatory = $true)]
    [string[]]$Files
)

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$isWindowsPlatform = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)
$isMacPlatform = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::OSX)

if ($isMacPlatform) {
    foreach ($file in $Files) {
        $full = [System.IO.Path]::GetFullPath($file)
        & /usr/bin/osascript -e "tell application \"Finder\" to delete POSIX file \"$full\"" | Out-Null
    }
    exit 0
}

if ($isWindowsPlatform) {
    Add-Type -AssemblyName Microsoft.VisualBasic
    foreach ($file in $Files) {
        $full = [System.IO.Path]::GetFullPath($file)
        [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile($full, [Microsoft.VisualBasic.FileIO.UIOption]::OnlyErrorDialogs, [Microsoft.VisualBasic.FileIO.RecycleOption]::SendToRecycleBin)
    }
    exit 0
}

$gio = Get-Command -Name gio -ErrorAction SilentlyContinue
if ($gio) {
    & $gio.Path 'trash' @Files
    exit $LASTEXITCODE
}

Write-Error 'no trash implementation available'
exit 1
