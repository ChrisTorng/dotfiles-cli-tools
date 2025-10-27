Feature: pastas script
  Streams clipboard changes to stdout.

  Scenario: Continuously display clipboard updates
    Given clipboard contents may change over time
    When I run "pastas"
    Then the script polls the clipboard and prints new values as they appear
    And the loop stops when interrupted
