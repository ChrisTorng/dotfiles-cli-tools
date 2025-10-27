Feature: lowered script
  Converts input text to lowercase.

  Scenario: Lowercase stdin content
    Given uppercase text on stdin
    When I run "lowered"
    Then the output is the same text converted to lowercase
    And the command exits successfully
