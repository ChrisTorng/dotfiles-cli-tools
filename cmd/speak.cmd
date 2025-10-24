@echo off
REM Speaks Markdown input aloud using say or espeak-ng if available.
REM Usage: speak < markdown

where say >nul 2>nul
if not errorlevel 1 (
  pandoc -f commonmark -t plain --wrap=preserve | say
  exit /b
)

where espeak-ng >nul 2>nul
if not errorlevel 1 (
  pandoc -f commonmark -t plain --wrap=preserve | espeak-ng
  exit /b
)

echo couldn't find any TTS program 1>&2
exit /b 1
