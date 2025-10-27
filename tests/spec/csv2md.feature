Feature: csv2md script
  Converts CSV files into Markdown tables.

  Scenario: Convert a CSV file
    Given a CSV file with headers and rows exists
    When I run "csv2md" with the file path
    Then the command prints a Markdown table with headers and padded rows
    And the command exits successfully
