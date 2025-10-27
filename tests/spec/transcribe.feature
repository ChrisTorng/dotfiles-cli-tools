Feature: transcribe script
  Uses OpenAI Whisper to transcribe audio from files or live recordings.

  Scenario: Transcribe provided audio files
    Given audio files exist on disk
    When I run "transcribe" with their paths
    Then the script invokes whisper with the small.en model to produce text files in the current directory

  Scenario: Record and transcribe live audio
    When I run "transcribe" without arguments
    Then the script records audio using arecord until interrupted, transcribes it with whisper, and prints the resulting text
