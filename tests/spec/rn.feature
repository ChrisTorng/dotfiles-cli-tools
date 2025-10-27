Feature: rn script
  Shows the current time and highlights today's date in the calendar.

  Scenario: Display time and calendar
    When I run "rn"
    Then the script prints the formatted current time and date
    And it outputs the current month's calendar with today's day highlighted
