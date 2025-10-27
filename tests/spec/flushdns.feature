Feature: flushdns script
  Clears local DNS caches on supported platforms.

  Scenario: Flush DNS on macOS
    Given the script runs on macOS
    When I execute "flushdns"
    Then the script clears the cache using dscacheutil and mDNSResponder
    And the command exits successfully

  Scenario: Flush DNS on Linux
    Given the script runs on Linux with systemd-resolve or resolvectl
    When I execute "flushdns"
    Then the script invokes the available resolver command with sudo when necessary
    And the command exits successfully

  Scenario: Flush DNS on Windows environments
    Given the script runs in a Windows-compatible shell
    When I execute "flushdns"
    Then the script tries ipconfig or PowerShell to clear the DNS cache
    And it reports an error if neither method is available
