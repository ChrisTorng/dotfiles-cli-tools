Feature: extensions script
  Outputs the unique file extensions from newline-separated paths.

  Scenario: Extract unique extensions
    Given a list of file paths on stdin
    When I run "extensions"
    Then the script prints each distinct extension once
    And entries without an extension are ignored
