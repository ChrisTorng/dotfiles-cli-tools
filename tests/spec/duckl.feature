Feature: duckl script
  Opens the lightweight DuckDuckGo interface with optional search terms.

  Scenario: Open DuckDuckGo Lite
    When I run "duckl" without arguments
    Then the browser opens https://lite.duckduckgo.com

  Scenario: Search with DuckDuckGo Lite
    When I run "duckl" with keywords
    Then the browser opens the Lite interface with the encoded query
