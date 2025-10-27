Feature: list-colors script
  Displays ANSI color codes from 0 to 255.

  Scenario: Show the color palette
    When I run "list-colors"
    Then the script prints each color index using its background color
    And the output includes all values from 0 through 255
