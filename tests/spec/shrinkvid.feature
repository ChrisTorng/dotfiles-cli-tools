Feature: shrinkvid script
  Re-encodes videos to H.264 with configurable quality.

  Scenario: Compress a video with default CRF
    When I run "shrinkvid" with input and output paths
    Then the script invokes ffmpeg to encode using libx264 with CRF 30 and preset superfast

  Scenario: Compress a video with custom CRF
    When I run "shrinkvid" with a third argument for CRF
    Then ffmpeg uses the provided CRF value for encoding
