Feature: uuid script
  Generates random UUID version 4 identifiers.

  Scenario: Generate a UUID
    When I run "uuid"
    Then the script prints a UUID v4 string without extra output
