Feature: length script
  Counts characters in the provided arguments.

  Scenario: Count characters in text
    When I run "length" with words as arguments
    Then the script prints the number of characters in the concatenated text
    And the command exits successfully
