Feature: emoji script
  Lists emoji definitions and filters them by search terms.

  Scenario: List all emoji entries
    When I run "emoji" without arguments
    Then the script prints the full catalog of emoji names and descriptions

  Scenario: Filter emoji by keyword
    When I run "emoji" with a search term
    Then only emoji entries matching the case-insensitive term are printed
