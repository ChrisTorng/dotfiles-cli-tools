<#
.SYNOPSIS
    Converts a CSV file into a Markdown table printed to stdout.
.DESCRIPTION
    PowerShell version of sh/csv2md using TextFieldParser for robust CSV parsing.
.PARAMETER CsvFile
    Path to the CSV file.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$CsvFile
)

Add-Type -AssemblyName Microsoft.VisualBasic
$resolved = Resolve-Path -LiteralPath $CsvFile
$parser = New-Object Microsoft.VisualBasic.FileIO.TextFieldParser($resolved)
$parser.TextFieldType = [Microsoft.VisualBasic.FileIO.FieldType]::Delimited
$parser.SetDelimiters(',')
$parser.HasFieldsEnclosedInQuotes = $true
try {
    if ($parser.EndOfData) {
        return
    }

    $header = $parser.ReadFields()
    if (-not $header) {
        return
    }

    [Console]::WriteLine('| ' + [string]::Join(' | ', $header) + ' |')
    [Console]::WriteLine('|' + ('---|' * $header.Length))

    while (-not $parser.EndOfData) {
        $row = $parser.ReadFields()
        if (-not $row) {
            $row = @()
        }
        $paddingLength = [Math]::Max(0, $header.Length - $row.Length)
        $padding = if ($paddingLength -gt 0) { New-Object string[] $paddingLength } else { @() }
        $extended = $row + $padding
        $formatted = $extended[0..($header.Length - 1)]
        [Console]::WriteLine('| ' + [string]::Join(' | ', $formatted) + ' |')
    }
} finally {
    $parser.Close()
}
