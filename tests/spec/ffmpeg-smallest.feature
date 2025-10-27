Feature: ffmpeg-smallest script
  Converts media into multiple formats and keeps the smallest file.

  Scenario: Convert to several formats and keep the smallest
    Given an input media file exists
    When I run "ffmpeg-smallest" with output basename and extensions
    Then the script uses ffmpeg to produce each candidate file
    And it renames the smallest result to the requested basename
    And the script reports whether the original or a converted file was chosen
