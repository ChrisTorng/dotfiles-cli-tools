Feature: each script
  Runs a command for every delimiter-separated value from stdin.

  Scenario: Execute a command for each line
    Given text input with multiple lines
    When I pipe the input to "each" with a command containing {}
    Then the specified command runs once per line with the placeholder replaced
    And the script stops on the first non-zero exit status
