Feature: serveit script
  Starts a simple HTTP file server on the chosen port.

  Scenario: Serve files on default port
    When I run "serveit" without arguments
    Then the script starts an HTTP server on port 8000 using the first available runtime

  Scenario: Serve files on a custom port
    When I run "serveit" with a port number
    Then the script starts the server on that port

  Scenario: Report missing runtimes
    Given none of php, python3, python, or ruby are available
    When I run "serveit"
    Then the script reports it is unable to start an HTTP server and exits with status 1
