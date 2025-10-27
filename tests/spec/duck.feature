Feature: duck script
  Opens DuckDuckGo with optional query terms.

  Scenario: Open DuckDuckGo homepage
    When I run "duck" without arguments
    Then my default browser opens https://duckduckgo.com

  Scenario: Search for keywords
    When I run "duck" with search terms
    Then the browser opens DuckDuckGo results for the encoded query
