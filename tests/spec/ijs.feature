Feature: ijs script
  Opens an interactive JavaScript console using available runtimes.

  Scenario: Start a JavaScript REPL
    Given at least one of deno, node, or osascript is installed
    When I run "ijs"
    Then the script starts the first available JavaScript REPL in preference order
    And it errors if no runtime is available
