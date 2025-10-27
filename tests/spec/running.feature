Feature: running script
  Lists running processes with optional filtering.

  Scenario: Show all running processes
    When I run "running" without arguments
    Then the script prints the PID and command for each process
    And it excludes its own process and the grep command from the output

  Scenario: Filter processes by name
    When I run "running" with a search term
    Then only matching processes are listed using case-insensitive search when appropriate
