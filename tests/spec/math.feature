Feature: math script
  Opens a calculator REPL using available tools.

  Scenario: Prefer rink when available
    Given the rink calculator is installed
    When I run "math"
    Then the script launches rink

  Scenario: Fall back to Python math shell
    Given rink is unavailable but Python 3 is installed
    When I run "math"
    Then the script starts python3 with math and statistics modules imported

  Scenario: Fall back to bc
    Given neither rink nor Python 3 is available but bc is installed
    When I run "math"
    Then the script launches bc

  Scenario: Report missing tools
    Given none of the supported calculators are available
    When I run "math"
    Then the script prints an error and exits with a non-zero status
