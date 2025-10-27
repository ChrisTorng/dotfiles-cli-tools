Feature: clock script
  Continuously displays the current time.

  Scenario: Show a ticking clock
    When I run the "clock" script
    Then the script runs watch to update the time every second
    And the time is formatted as hours, minutes, and seconds with AM or PM
