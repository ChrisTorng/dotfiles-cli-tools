param(
    [string[]]$Words
)

if ($null -eq $Words -or $Words.Count -eq 0) {
    exit 0
}

$dictionary = @{
    'a' = 'Alfa';
    'b' = 'Bravo';
    'c' = 'Charlie';
    'd' = 'Delta';
    'e' = 'Echo';
    'f' = 'Foxtrot';
    'g' = 'Golf';
    'h' = 'Hotel';
    'i' = 'India';
    'j' = 'Juliett';
    'k' = 'Kilo';
    'l' = 'Lima';
    'm' = 'Mike';
    'n' = 'November';
    'o' = 'Oscar';
    'p' = 'Papa';
    'q' = 'Quebec';
    'r' = 'Romeo';
    's' = 'Sierra';
    't' = 'Tango';
    'u' = 'Uniform';
    'v' = 'Victor';
    'w' = 'Whiskey';
    'x' = 'X-ray';
    'y' = 'Yankee';
    'z' = 'Zulu';
    '1' = 'One';
    '2' = 'Two';
    '3' = 'Three';
    '4' = 'Four';
    '5' = 'Five';
    '6' = 'Six';
    '7' = 'Seven';
    '8' = 'Eight';
    '9' = 'Nine';
    '0' = 'Zero'
}

$joined = [string]::Join(' ', $Words)
foreach ($word in $joined.Split([char]::IsWhiteSpace, [System.StringSplitOptions]::RemoveEmptyEntries)) {
    $letters = foreach ($char in $word.ToLowerInvariant().ToCharArray()) {
        if ($dictionary.ContainsKey($char)) {
            $dictionary[$char]
        } else {
            $char
        }
    }
    Write-Output ($letters -join ' ')
}
