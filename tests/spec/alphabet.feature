Feature: alphabet script
  Prints both lowercase and uppercase alphabets for reference.

  Scenario: Show alphabets without arguments
    When I run the "alphabet" script without arguments
    Then the output contains "abcdefghijklmnopqrstuvwxyz"
    And the output contains "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    And the command exits successfully
