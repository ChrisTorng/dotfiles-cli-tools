Feature: mksh script
  Creates a new executable bash script template and opens it in the editor.

  Scenario: Scaffold a new shell script
    Given the target file does not yet exist
    When I run "mksh" with the desired path
    Then the script creates the file with a bash template and executable permissions
    And the file is opened in the editor defined by $EDITOR

  Scenario: Reject invalid usage
    When I run "mksh" without exactly one argument or target exists
    Then the script prints an error and exits with status 1
