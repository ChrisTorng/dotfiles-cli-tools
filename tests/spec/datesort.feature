Feature: datesort script
  Organizes files into subdirectories based on leading year prefixes.

  Scenario: Review planned moves before confirmation
    Given a directory contains files with leading year prefixes
    When I run "datesort" with the directory path
    Then the script lists the proposed moves grouped by year-based folders
    And it prompts for confirmation before renaming

  Scenario: Confirm the reorganization
    Given I review the proposed moves
    When I type "ok" at the prompt
    Then the files are moved into the appropriate year subdirectories
