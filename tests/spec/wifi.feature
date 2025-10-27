Feature: wifi script
  Provides Wi-Fi status and management helpers.

  Scenario: Show Wi-Fi status
    When I run "wifi status"
    Then the script reports whether Wi-Fi is enabled or disabled on macOS

  Scenario: List available networks
    Given Wi-Fi is enabled
    When I run "wifi list"
    Then the script uses the platform tool to list nearby networks or reports unsupported platforms

  Scenario: Join a network
    Given Wi-Fi is enabled on macOS
    When I run "wifi join" with an SSID and password
    Then the script attempts to join the network

  Scenario: Toggle Wi-Fi power
    When I run "wifi off" or "wifi on"
    Then the script disables or enables Wi-Fi using platform-specific commands

  Scenario: Toggle Wi-Fi cycle
    When I run "wifi toggle"
    Then the script turns Wi-Fi off and back on using the appropriate commands

  Scenario: Show help
    When I run "wifi" without arguments or with "help"
    Then the script prints usage instructions
