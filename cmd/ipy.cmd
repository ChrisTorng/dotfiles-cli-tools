@echo off
REM Starts the Python interactive interpreter.
REM Usage: ipy

where python3 >nul 2>nul
if not errorlevel 1 (
  python3 -i
  exit /b
)

where python >nul 2>nul
if not errorlevel 1 (
  python -i
  exit /b
)

where py >nul 2>nul
if not errorlevel 1 (
  py -3
  exit /b
)

echo python interpreter not found 1>&2
exit /b 1
