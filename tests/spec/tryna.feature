Feature: tryna script
  Repeats a command until it succeeds.

  Scenario: Retry a failing command until success
    Given a command may fail initially
    When I run "tryna" with the command
    Then the script executes the command repeatedly with pauses until it exits with status 0
