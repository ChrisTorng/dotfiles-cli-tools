Feature: bb script
  Launches a background command while silencing terminal output.

  Scenario: Run a command in the background
    Given I am in a terminal session
    When I run the "bb" script with a sample command
    Then the command launches in the background
    And stdout and stderr are silenced when attached to a terminal
