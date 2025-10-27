Feature: isql script
  Opens an in-memory SQLite shell.

  Scenario: Start SQLite in-memory session
    Given sqlite3 is installed
    When I run "isql"
    Then the script executes "sqlite3 :memory:"
