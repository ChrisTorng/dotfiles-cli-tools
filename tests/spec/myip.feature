Feature: myip script
  Reports local and/or public IP addresses.

  Scenario: Show local IP
    When I run "myip" with "local"
    Then the script prints the machine's local IP address

  Scenario: Show global IP
    When I run "myip" with "global"
    Then the script fetches and prints the public IP address

  Scenario: Show both IPs
    When I run "myip" with arguments requesting both
    Then the script prints labeled local and global addresses

  Scenario: Reject invalid arguments
    When I run "myip" with unsupported parameters
    Then the script fails argument parsing and prints usage information
