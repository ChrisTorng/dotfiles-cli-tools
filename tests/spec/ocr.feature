Feature: ocr script
  Performs optical character recognition on images using Apple's Vision framework.

  Scenario: Recognize text from an image
    Given the script runs on macOS with Vision available
    When I run "ocr" with an image path
    Then the script outputs the recognized text lines from the image
    And it exits with an error if the image cannot be processed
