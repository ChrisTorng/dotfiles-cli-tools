Feature: theme script
  Runs each theme helper script with the provided arguments.

  Scenario: Apply theme changes
    Given ~/.config/evanhahn-theme-scripts.d contains executable scripts
    When I run "theme" with arguments
    Then each script in the directory is invoked with the same arguments in sequence
