Feature: trash script
  Moves files to the system trash using platform-specific tools.

  Scenario: Move files to trash on macOS
    Given the script runs on macOS
    When I run "trash" with file paths
    Then the script resolves each path and asks Finder to delete the files

  Scenario: Move files to trash on other platforms
    Given the script runs on a system with gio installed
    When I run "trash" with file paths
    Then the script invokes "gio trash" with the same paths
