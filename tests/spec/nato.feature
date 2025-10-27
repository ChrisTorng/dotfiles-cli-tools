Feature: nato script
  Spells words using the NATO phonetic alphabet and digits.

  Scenario: Spell text with NATO alphabet
    When I run "nato" with a phrase
    Then the script prints each character's phonetic representation on its own line
    And unsupported characters are printed as themselves
