Feature: sleepybear script
  Puts the computer to sleep using platform-specific commands.

  Scenario: Sleep on macOS
    Given the script runs on macOS
    When I run "sleepybear"
    Then the script uses osascript to trigger system sleep

  Scenario: Sleep on Linux
    Given the script runs on Linux
    When I run "sleepybear"
    Then the script executes systemctl suspend

  Scenario: Sleep on Windows-like environments
    Given the script runs in a Windows-compatible shell
    When I run "sleepybear"
    Then the script tries rundll32 or PowerShell to sleep the machine and errors if unavailable
