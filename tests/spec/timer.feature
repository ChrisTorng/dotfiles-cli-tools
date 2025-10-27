Feature: timer script
  Runs a countdown and notifies when time elapses.

  Scenario: Run a timer for a number of seconds
    When I run "timer" with a number of seconds
    Then the script sleeps for that duration
    And it plays the "ringaling" sound effect and sends a notification labeled "timer complete"
