Feature: line script
  Outputs a specific line from stdin.

  Scenario: Print the requested line number
    Given multi-line text on stdin
    When I run "line" with a line number
    Then the script prints only that numbered line
    And the command exits successfully
