Feature: pingbing script
  Performs a connectivity check against duckduckgo.com.

  Scenario: Ping duckduckgo.com once
    When I run "pingbing"
    Then the script executes "ping -c 1 duckduckgo.com"
    And the exit status reflects the ping result
