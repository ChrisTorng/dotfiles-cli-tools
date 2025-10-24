param(
    [int]$Length = 6
)

if ($Length -le 0) {
    Write-Error "length must be positive" -ErrorAction Stop
}

$digits = 0..($Length - 1) | ForEach-Object { Get-Random -Minimum 0 -Maximum 10 }
Write-Output ($digits -join '')
