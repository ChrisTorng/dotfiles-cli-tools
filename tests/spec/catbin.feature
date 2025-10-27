Feature: catbin script
  Shows the contents of a command found on the PATH.

  Scenario: Inspect an executable in the PATH
    Given an executable exists on the PATH
    When I run "catbin" with the executable name
    Then the script resolves the command path
    And it prints the file contents using bat when available
    And it falls back to cat otherwise
