Feature: ds-destroy script
  Removes all .DS_Store files within the current directory tree.

  Scenario: Delete macOS metadata files recursively
    When I run "ds-destroy" in a project directory
    Then all .DS_Store files beneath the directory are deleted
    And the command exits successfully
