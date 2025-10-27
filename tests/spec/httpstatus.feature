Feature: httpstatus script
  Displays HTTP status codes with optional filtering.

  Scenario: Show all HTTP status codes
    When I run "httpstatus" without arguments
    Then the script prints the known HTTP status code list

  Scenario: Filter HTTP status codes
    When I run "httpstatus" with a search pattern
    Then only matching status codes are printed case-insensitively
