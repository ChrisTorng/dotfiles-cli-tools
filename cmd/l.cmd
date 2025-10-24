@echo off
REM Runs ls with the provided arguments.
REM Usage: l [ls-args...]

if "%~1"=="" (
  dir
) else (
  dir %*
)
