#!/usr/bin/env pwsh
# Transcribes audio files with whisper or records audio via arecord before transcribing.
# Usage: transcribe.ps1 [paths...]

Set-StrictMode -Version Latest
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$Paths
)

function Invoke-Whisper {
    param([string[]]$InputPaths, [string]$OutputDir)
    $whisper = Get-Command -Name whisper -ErrorAction SilentlyContinue
    if (-not $whisper) {
        Write-Error 'whisper command not found'
        exit 1
    }
    $arguments = @('--language', 'en', '--verbose', 'False', '--output_format', 'txt', '--output_dir', $OutputDir, '--task', 'transcribe', '--model', 'small.en') + $InputPaths
    & $whisper.Path @arguments
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

function Record-Audio {
    param([string]$OutputPath)
    $arecord = Get-Command -Name arecord -ErrorAction SilentlyContinue
    if (-not $arecord) {
        Write-Error 'arecord command not found; provide audio files to transcribe'
        exit 1
    }
    Write-Output "Recording... press Ctrl+C to stop"
    $proc = Start-Process -FilePath $arecord.Path -ArgumentList @('--file-type', 'wav', '--channels=1', '--format=cd', '--vumeter=mono', $OutputPath) -PassThru
    try {
        Wait-Process -Id $proc.Id
    } catch [System.Management.Automation.PipelineStoppedException] {
        Stop-Process -Id $proc.Id -Force -ErrorAction SilentlyContinue
    } catch [System.OperationCanceledException] {
        Stop-Process -Id $proc.Id -Force -ErrorAction SilentlyContinue
    }
}

if ($Paths -and $Paths.Count -gt 0) {
    Invoke-Whisper -InputPaths $Paths -OutputDir (Get-Location).Path
    exit 0
}

$tempName = [System.IO.Path]::GetRandomFileName()
$wavPath = Join-Path ([System.IO.Path]::GetTempPath()) ([System.IO.Path]::ChangeExtension($tempName, '.wav'))
Record-Audio -OutputPath $wavPath
Invoke-Whisper -InputPaths @($wavPath) -OutputDir ([System.IO.Path]::GetDirectoryName($wavPath))

$transcriptionPath = [System.IO.Path]::ChangeExtension($wavPath, '.txt')
if (Test-Path -LiteralPath $transcriptionPath) {
    Get-Content -LiteralPath $transcriptionPath
}
