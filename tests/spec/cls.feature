Feature: cls script
  Clears the terminal display.

  Scenario: Clear the terminal
    When I run "cls"
    Then the terminal screen is cleared using the clear command
