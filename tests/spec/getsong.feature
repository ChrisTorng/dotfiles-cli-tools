Feature: getsong script
  Retrieves the best available audio stream using yt-dlp.

  Scenario: Download best audio with default naming
    When I run "getsong" with a media URL
    Then the script invokes yt-dlp to download the best audio format
    And the resulting file is named with the media title and extension
    And the command exits successfully when yt-dlp completes
