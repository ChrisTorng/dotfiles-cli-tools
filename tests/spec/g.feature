Feature: g script
  Provides a shortcut for git commands.

  Scenario: Show status when no arguments are provided
    When I run "g" without arguments
    Then the script runs "git status"
    And the command exits successfully

  Scenario: Forward git arguments
    When I run "g" with additional git parameters
    Then the script executes git with the same parameters
    And the exit status matches the git command
