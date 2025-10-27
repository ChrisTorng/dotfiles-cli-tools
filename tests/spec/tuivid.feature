Feature: tuivid script
  Plays video in the terminal using mpv's TCT output.

  Scenario: Display video in terminal mode
    When I run "tuivid" with a video path
    Then the script launches mpv with tct video output and terminal-friendly settings
