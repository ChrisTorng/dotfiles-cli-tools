<#
.SYNOPSIS
    Runs a command in the background while silencing stdout/stderr when launched from an interactive terminal.
.DESCRIPTION
    Mirrors sh/bb. If stdout or stderr are connected to a terminal, they are redirected to $null in the job.
.EXAMPLE
    ./bb.ps1 ping example.com
#>
[CmdletBinding()]
param(
    [Parameter(ValueFromRemainingArguments = $true, Mandatory = $true)]
    [string[]]$Command
)

$commandName = $Command[0]
$commandArgs = if ($Command.Length -gt 1) { $Command[1..($Command.Length - 1)] } else { @() }

$stdoutIsTerminal = -not [Console]::IsOutputRedirected
$stderrIsTerminal = -not [Console]::IsErrorRedirected

Start-Job -ScriptBlock {
    param($cmd, $args, $silenceStdout, $silenceStderr)
    $invokeArgs = if ($args) { $args } else { @() }
    if ($silenceStdout -and $silenceStderr) {
        & $cmd @invokeArgs *> $null
    } elseif ($silenceStdout) {
        & $cmd @invokeArgs 1>$null
    } elseif ($silenceStderr) {
        & $cmd @invokeArgs 2>$null
    } else {
        & $cmd @invokeArgs
    }
} -ArgumentList $commandName, $commandArgs, $stdoutIsTerminal, $stderrIsTerminal | Out-Null
