Feature: pingen script
  Generates random numeric PIN codes.

  Scenario: Generate default length PIN
    When I run "pingen" without arguments
    Then the script outputs a six-digit random PIN using /dev/urandom

  Scenario: Generate custom length PIN
    When I run "pingen" with a length argument
    Then the script outputs a random PIN containing that many digits
