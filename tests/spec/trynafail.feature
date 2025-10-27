Feature: trynafail script
  Repeats a command until it fails.

  Scenario: Repeat a command until failure
    Given a command initially succeeds
    When I run "trynafail" with the command
    Then the script executes the command repeatedly with pauses until it exits with a non-zero status
