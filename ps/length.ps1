param(
    [string[]]$Text
)

if ($null -eq $Text -or $Text.Count -eq 0) {
    $joined = ""
} else {
    $joined = [string]::Join(' ', $Text)
}

Write-Output ($joined.Length)
