Feature: scratch script
  Opens a temporary file in the configured editor for quick notes.

  Scenario: Edit a temporary scratch file
    When I run "scratch"
    Then the script creates a temporary file and prints its path
    And it opens the file in the editor defined by $EDITOR
