Feature: f script
  Provides a shorthand for grep.

  Scenario: Search using grep shorthand
    When I run the "f" script with grep arguments
    Then the script executes grep with the same arguments
    And the exit status matches the underlying grep command
