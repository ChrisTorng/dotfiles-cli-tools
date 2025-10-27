Feature: tunes script
  Streams audio using mpv without video.

  Scenario: Play audio-only streams
    When I run "tunes" with one or more URLs
    Then the script launches mpv with --no-video and a worst-audio format preference
