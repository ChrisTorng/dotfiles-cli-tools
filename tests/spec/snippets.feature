Feature: snippets script
  Prints stored snippet files from the configuration directory.

  Scenario: Output an existing snippet
    Given a snippet file exists under ~/.config/evanhahn-snippets
    When I run "snippets" with its name
    Then the script prints the snippet contents

  Scenario: Handle missing snippet
    When I run "snippets" with a name that does not exist
    Then the script prints an error message and exits with status 1

  Scenario: Require exactly one argument
    When I run "snippets" with zero or multiple arguments
    Then the script prints a usage error and exits with status 1
