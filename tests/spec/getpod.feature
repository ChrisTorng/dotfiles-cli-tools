Feature: getpod script
  Downloads audio from a URL with podcast-friendly settings using yt-dlp.

  Scenario: Fetch audio as an MP3
    When I run "getpod" with a video URL
    Then yt-dlp downloads the source, extracts audio, embeds metadata, and saves an MP3 file
    And the command exits successfully when yt-dlp completes
