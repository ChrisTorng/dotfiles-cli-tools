Feature: speak script
  Converts Markdown input to speech using available TTS tools.

  Scenario: Speak text using say
    Given pandoc and say are installed
    When I pipe Markdown into "speak"
    Then the script converts the Markdown to plain text and speaks it with say

  Scenario: Fallback to espeak-ng
    Given say is unavailable but espeak-ng is installed
    When I pipe Markdown into "speak"
    Then the script uses espeak-ng for speech

  Scenario: Report missing TTS engines
    Given neither say nor espeak-ng is available
    When I pipe Markdown into "speak"
    Then the script prints an error and exits with status 1
