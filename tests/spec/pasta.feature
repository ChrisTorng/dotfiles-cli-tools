Feature: pasta script
  Prints clipboard contents using platform-specific utilities.

  Scenario: Read clipboard contents
    Given clipboard data is available
    When I run "pasta"
    Then the script outputs the clipboard text using pbpaste, xclip, or a fallback file
    And it prints an empty line if no clipboard source exists
