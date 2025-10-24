@echo off
REM Opens an interactive JavaScript REPL using Deno, Node, or osascript.
REM Usage: ijs

where deno >nul 2>nul
if not errorlevel 1 (
  deno repl
  exit /b
)

where node >nul 2>nul
if not errorlevel 1 (
  node
  exit /b
)

where osascript >nul 2>nul
if not errorlevel 1 (
  osascript -il JavaScript
  exit /b
)

echo no js runtime found 1>&2
exit /b 1
