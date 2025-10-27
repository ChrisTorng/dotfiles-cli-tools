Feature: waitfor script
  Prevents the system from sleeping while waiting for a PID to exit.

  Scenario: Wait for a process using platform tools
    When I run "waitfor" with a PID
    Then the script keeps the system awake using caffeinate, systemd-inhibit, or tail --pid until the process exits
