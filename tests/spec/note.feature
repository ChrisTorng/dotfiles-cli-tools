Feature: note script
  Creates dated Markdown notes and opens them in the configured editor.

  Scenario: Create a daily note in the notes folder
    When I run "note" with an optional title
    Then a note file named with today's date and cleaned title is created under ~/notes
    And the note is opened in the configured editor with the notes directory as CWD

  Scenario: Create an archived note
    When I run "note --archive"
    Then the note is stored under ~/notes/archive/<year>/ with today's date prefix
    And the script ensures necessary directories exist
