Feature: getsubs script
  Fetches YouTube subtitles and prints them as cleaned plain text.

  Scenario: Download and print subtitles
    When I run "getsubs" with a YouTube URL
    Then the script downloads available subtitles or auto-generated captions
    And it parses the VTT file into de-duplicated text lines
    And the lines are printed to stdout in order
    And the command exits successfully when subtitles are retrieved

  Scenario: Handle missing subtitles
    When I run "getsubs" for a video without captions
    Then the script reports that no subtitles were found
    And it exits with a non-zero status
