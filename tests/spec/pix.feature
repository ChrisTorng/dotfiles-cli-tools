Feature: pix script
  Displays images using mpv with infinite looping per file.

  Scenario: Show images in mpv
    When I run "pix" with one or more image paths
    Then the script launches mpv with infinite display duration and loop per file
    And the command exits with mpv's status
