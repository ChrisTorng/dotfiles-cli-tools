Feature: url script
  Parses a URL and prints its components.

  Scenario: Parse a full URL
    When I run "url" with a URL containing credentials, path, query, and hash
    Then the script prints each available component including query parameters on separate lines
