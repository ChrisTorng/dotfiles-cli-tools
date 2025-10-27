Feature: radio script
  Streams preset internet radio stations with mpv.

  Scenario: Play a known station
    Given I choose one of the supported station names
    When I run "radio" with that name
    Then the script maps the name to its stream URL and starts mpv

  Scenario: Reject unknown stations
    When I run "radio" with an unsupported name
    Then the script prints an error message and exits with status 1
