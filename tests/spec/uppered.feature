Feature: uppered script
  Converts input text to uppercase.

  Scenario: Uppercase stdin content
    Given lowercase text on stdin
    When I run "uppered"
    Then the output is the same text converted to uppercase
    And the command exits successfully
