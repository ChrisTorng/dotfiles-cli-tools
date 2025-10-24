<#
.SYNOPSIS
    Copies stdin or a file's contents to the system clipboard.
.DESCRIPTION
    PowerShell translation of sh/copy with platform fallbacks.
.PARAMETER Path
    Optional file path to read instead of stdin.
#>
[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [string]$Path
)

$useFile = $PSBoundParameters.ContainsKey('Path')
$resolvedPath = $null
if ($useFile) {
    $resolvedPath = Resolve-Path -LiteralPath $Path
}

function Get-ClipboardText {
    param(
        [string]$ResolvedPath,
        [bool]$UseFile
    )

    if ($UseFile) {
        return [System.IO.File]::ReadAllText($ResolvedPath)
    }

    return [Console]::In.ReadToEnd()
}

$text = Get-ClipboardText -ResolvedPath $resolvedPath -UseFile $useFile
if (-not $text) {
    $text = ""
}

$setClipboardCmd = Get-Command -Name Set-Clipboard -ErrorAction SilentlyContinue
if ($setClipboardCmd) {
    Set-Clipboard -Value $text
    return
}

function Invoke-ClipboardUtility {
    param(
        [string]$CommandName,
        [string[]]$Arguments = @()
    )

    $command = Get-Command -Name $CommandName -ErrorAction SilentlyContinue
    if (-not $command) {
        return $false
    }

    $psi = New-Object System.Diagnostics.ProcessStartInfo
    $psi.FileName = $command.Source
    $psi.Arguments = [string]::Join(' ', $Arguments)
    $psi.UseShellExecute = $false
    $psi.RedirectStandardInput = $true
    $psi.CreateNoWindow = $true

    $process = [System.Diagnostics.Process]::Start($psi)
    $process.StandardInput.Write($text)
    $process.StandardInput.Close()
    $process.WaitForExit()
    return $process.ExitCode -eq 0
}

if (Invoke-ClipboardUtility -CommandName 'pbcopy') { return }
if (Invoke-ClipboardUtility -CommandName 'xclip' -Arguments @('-selection', 'clipboard')) { return }
if (Invoke-ClipboardUtility -CommandName 'putclip') { return }
if ($IsLinux -and Invoke-ClipboardUtility -CommandName 'wl-copy') { return }
if ($IsWindows -and Invoke-ClipboardUtility -CommandName 'clip') { return }

throw "No supported clipboard utility available."
