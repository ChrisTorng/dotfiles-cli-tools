Feature: cptmp script
  Produces a temporary file path and copies it to the clipboard.

  Scenario: Generate a temporary file path
    When I run "cptmp"
    Then the script prints a unique temporary file path without a trailing newline
    And the same path is copied into the clipboard using the copy helper
