Feature: stopwatch script
  Measures elapsed time by timing stdin.

  Scenario: Time the duration of input
    When I run "stopwatch" and provide input until EOF
    Then the script prints the start time, runs the time command on cat, and prints the stop time
