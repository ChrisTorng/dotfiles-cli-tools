#!/usr/bin/env pwsh
# Spells the supplied words using the NATO phonetic alphabet.
# Usage: nato <text...>

param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$Words
)

$dictionary = @{
    'a' = 'Alfa'
    'b' = 'Bravo'
    'c' = 'Charlie'
    'd' = 'Delta'
    'e' = 'Echo'
    'f' = 'Foxtrot'
    'g' = 'Golf'
    'h' = 'Hotel'
    'i' = 'India'
    'j' = 'Juliett'
    'k' = 'Kilo'
    'l' = 'Lima'
    'm' = 'Mike'
    'n' = 'November'
    'o' = 'Oscar'
    'p' = 'Papa'
    'q' = 'Quebec'
    'r' = 'Romeo'
    's' = 'Sierra'
    't' = 'Tango'
    'u' = 'Uniform'
    'v' = 'Victor'
    'w' = 'Whiskey'
    'x' = 'X-ray'
    'y' = 'Yankee'
    'z' = 'Zulu'
    '1' = 'One'
    '2' = 'Two'
    '3' = 'Three'
    '4' = 'Four'
    '5' = 'Five'
    '6' = 'Six'
    '7' = 'Seven'
    '8' = 'Eight'
    '9' = 'Nine'
    '0' = 'Zero'
}

$joinedWords = if ($Words) { [string]::Join(' ', $Words) } else { '' }
$tokens = $joinedWords -split '\s+'

foreach ($word in $tokens) {
    if (-not $word) {
        continue
    }

    $letters = foreach ($char in $word.ToCharArray()) {
        $lower = $char.ToString().ToLowerInvariant()
        if ($dictionary.ContainsKey($lower)) {
            $dictionary[$lower]
        }
        else {
            $char
        }
    }

    Write-Output ($letters -join ' ')
}
