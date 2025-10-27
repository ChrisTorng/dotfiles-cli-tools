Feature: movs2mp4s script
  Converts MOV files in the current directory to MP4 using ffmpeg in parallel.

  Scenario: Convert MOV files concurrently
    Given the working directory contains MOV files
    When I run "movs2mp4s"
    Then the script spawns ffmpeg conversions for each MOV file concurrently
    And it reports success or failure for each conversion
