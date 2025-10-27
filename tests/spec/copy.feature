Feature: copy script
  Copies data into the system clipboard using platform fallbacks.

  Scenario: Copy piped text into the clipboard
    Given clipboard utilities such as pbcopy, xclip, or putclip are available
    When I pipe text into the "copy" script
    Then the text is stored in the system clipboard
    And the command exits successfully

  Scenario: Copy a file into the clipboard
    Given a file exists
    When I run "copy" with the file path
    Then the file contents are stored in the system clipboard or a fallback file
    And the command exits successfully
