Feature: nagd script
  Sends periodic desktop reminders via the notify helper.

  Scenario: Start recurring notifications
    When I run "nagd"
    Then an initial notification is sent informing about the reminder interval
    And the script schedules recurring notifications every 20 minutes until interrupted
