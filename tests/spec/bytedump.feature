Feature: bytedump script
  Outputs file bytes with optional delimiter and hexadecimal formatting.

  Scenario: Dump bytes with default options
    Given a binary file exists
    When I run "bytedump" with the file path
    Then the command prints each byte separated by commas
    And the command exits successfully

  Scenario: Dump bytes as hexadecimal
    Given a binary file exists
    When I run "bytedump" with "--hex" and a custom delimiter
    Then each byte is printed in hexadecimal using the requested delimiter
    And the command exits successfully
