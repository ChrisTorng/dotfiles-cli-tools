Feature: cpwd script
  Copies the current working directory path into the clipboard.

  Scenario: Copy the current directory path
    When I run "cpwd" from a directory
    Then the script prints the directory path without a trailing newline
    And the path is copied into the clipboard
