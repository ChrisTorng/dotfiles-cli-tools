Feature: straightquote script
  Converts curly quotation marks to straight ASCII quotes.

  Scenario: Normalize curly quotes
    Given text containing curly quotes on stdin
    When I run "straightquote"
    Then the output replaces double curly quotes with " and single curly quotes with '
    And the command exits successfully
