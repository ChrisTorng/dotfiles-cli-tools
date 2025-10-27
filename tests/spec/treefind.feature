Feature: treefind script
  Runs tree with optional pattern matching.

  Scenario: Show entire tree by default
    When I run "treefind" without arguments
    Then the script executes "tree ." to display the directory tree

  Scenario: Highlight matches within the current directory
    When I run "treefind" with a pattern
    Then the script searches the current directory for matching paths and highlights them, using case-insensitive matching when appropriate

  Scenario: Search within a specified directory
    When I run "treefind" with a pattern and directory path
    Then the script runs tree from that directory with the provided pattern

  Scenario: Reject invalid argument counts
    When I run "treefind" with more than two arguments
    Then the script prints an error and exits with status 1
