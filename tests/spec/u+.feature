Feature: u+ script
  Displays the character and name for a Unicode code point.

  Scenario: Look up a Unicode code point
    When I run "u+" with a hexadecimal code point
    Then the script prints the character followed by its official Unicode name
