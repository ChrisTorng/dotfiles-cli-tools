Feature: la script
  Lists files including hidden ones with platform-appropriate color flags.

  Scenario: List files with automatic color flag
    When I run "la"
    Then the script runs "ls -a" with -G on macOS or --color elsewhere
    And it forwards any additional arguments to ls
