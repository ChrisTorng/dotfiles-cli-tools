Feature: ipy script
  Starts the Python interactive interpreter.

  Scenario: Launch Python REPL
    Given Python 3 is installed
    When I run "ipy"
    Then the script executes "python3 -i"
