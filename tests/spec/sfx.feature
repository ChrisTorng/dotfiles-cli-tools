Feature: sfx script
  Plays sound effects from the configured directory using mpv.

  Scenario: Play a named sound effect
    Given the configured sound effect file exists
    When I run "sfx" with the effect name
    Then the script launches mpv to play the corresponding .ogg file without video
