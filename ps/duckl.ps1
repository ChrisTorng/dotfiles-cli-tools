<#
.SYNOPSIS
    Opens the lightweight DuckDuckGo interface with an optional search query.
.DESCRIPTION
    PowerShell port of sh/duckl.
#>
[CmdletBinding()]
param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$SearchTerms
)

$baseUrl = 'https://lite.duckduckgo.com'
$url = if (-not $SearchTerms -or $SearchTerms.Count -eq 0) {
    $baseUrl
} else {
    $encoded = $SearchTerms | ForEach-Object { [System.Uri]::EscapeDataString($_) }
    "$baseUrl/lite?q=$([string]::Join('+', $encoded))"
}

$browserEnv = $env:BROWSER
$browserCommand = if ([string]::IsNullOrEmpty($browserEnv)) { $null } else { Get-Command -Name $browserEnv -ErrorAction SilentlyContinue }

function Invoke-BrowserCommand {
    param(
        [string]$CommandName,
        [string]$Argument
    )

    $command = Get-Command -Name $CommandName -ErrorAction SilentlyContinue
    if (-not $command) {
        return $false
    }

    Start-Process -FilePath $command.Source -ArgumentList $Argument | Out-Null
    return $true
}

if ($browserCommand) {
    Start-Process -FilePath $browserCommand.Source -ArgumentList $url | Out-Null
    return
}

try {
    Start-Process -FilePath $url | Out-Null
    return
} catch {
    if ($IsMacOS -and Invoke-BrowserCommand -CommandName 'open' -Argument $url) { return }
    if ($IsLinux -and Invoke-BrowserCommand -CommandName 'xdg-open' -Argument $url) { return }
    if ($IsWindows -and Invoke-BrowserCommand -CommandName 'start' -Argument $url) { return }
    throw "Unable to open browser for $url"
}
