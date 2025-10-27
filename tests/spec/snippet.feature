Feature: snippet script
  Forwards arguments to the snippets helper command.

  Scenario: Run snippets helper
    When I run "snippet" with arguments
    Then the script executes "snippets" with the same arguments
