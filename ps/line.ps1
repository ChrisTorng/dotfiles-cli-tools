param(
    [Parameter(Mandatory = $true)]
    [int]$Number
)

if ($Number -le 0) {
    Write-Error "number must be positive" -ErrorAction Stop
}

$index = 0
while (($line = [Console]::In.ReadLine()) -ne $null) {
    $index += 1
    if ($index -eq $Number) {
        Write-Output $line
        exit 0
    }
}
exit 1
