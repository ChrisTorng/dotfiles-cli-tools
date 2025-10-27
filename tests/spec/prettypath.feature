Feature: prettypath script
  Prints each directory in PATH on a separate line.

  Scenario: Display PATH entries line by line
    When I run "prettypath"
    Then the script splits the PATH environment variable on colons and prints each entry on its own line
