Feature: l script
  Runs ls with the provided arguments.

  Scenario: List directory contents
    When I run "l" with custom arguments
    Then the script executes ls with the same arguments
    And the exit status matches ls
