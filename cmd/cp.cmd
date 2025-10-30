@echo off
REM Copies stdin or a file's contents to the system clipboard with several platform fallbacks.
REM Usage: copy [file]

if "%~1"=="" (
  clip
  exit /b
)

if not exist "%~1" (
  echo file not found: %~1 1>&2
  exit /b 1
)

type "%~1" | clip
