Feature: hoy script
  Prints today's date in YYYY-MM-DD format without a newline.

  Scenario: Get today's date
    When I run "hoy"
    Then the script outputs the current date formatted as YYYY-MM-DD without a trailing newline
