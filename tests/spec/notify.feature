Feature: notify script
  Sends desktop notifications with platform-specific fallbacks.

  Scenario: Send a notification with title and message
    When I run "notify" with a title and body
    Then the script attempts notify-send, then falls back to macOS JavaScript automation
    And it reports an error if no notification mechanism is available

  Scenario: Use defaults when arguments are omitted
    When I run "notify" without parameters
    Then the script sends a notification titled "Notification" with the current timestamp as the message
