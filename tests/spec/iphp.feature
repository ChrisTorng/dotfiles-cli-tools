Feature: iphp script
  Launches the PHP interactive shell.

  Scenario: Open the PHP REPL
    Given PHP is installed
    When I run "iphp"
    Then the script executes "php -a"
