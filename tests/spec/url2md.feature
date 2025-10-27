Feature: url2md script
  Fetches a web page via jina.ai and outputs Markdown-formatted content.

  Scenario: Convert a URL to Markdown
    When I run "url2md" with a URL
    Then the script requests the page through r.jina.ai with the configured headers
    And it prints the Markdown-formatted response to stdout
