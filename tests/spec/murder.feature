Feature: murder script
  Kills processes by PID, name, or port with confirmation.

  Scenario: Terminate a process by PID
    Given a process ID is running
    When I run "murder" with the PID
    Then the script sends escalating signals until the process exits

  Scenario: Terminate processes by name
    Given processes matching a name are running
    When I run "murder" with the process name
    Then the script lists matches and asks for confirmation before killing each

  Scenario: Terminate processes by port
    Given a service is listening on a port
    When I run "murder" with the port prefixed by a colon
    Then the script resolves the owning processes and prompts before killing them

  Scenario: Show usage on missing arguments
    When I run "murder" without arguments
    Then the script prints usage instructions and exits with status 1
