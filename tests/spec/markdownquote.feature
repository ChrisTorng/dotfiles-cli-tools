Feature: markdownquote script
  Converts text into Markdown blockquote format.

  Scenario: Quote input text
    Given lines of text on stdin
    When I run "markdownquote"
    Then non-empty lines are prefixed with "> " and blank lines become single ">" markers
    And existing blockquote prefixes are preserved
