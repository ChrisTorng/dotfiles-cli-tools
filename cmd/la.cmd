@echo off
REM Runs ls -a with color flags appropriate for the current platform.
REM Usage: la [ls-args...]

if "%~1"=="" (
  dir /A
) else (
  dir /A %*
)
