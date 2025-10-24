@echo off
REM Plays a named sound effect from the configured effects directory using mpv.
REM Usage: sfx <effect-name>

if "%~1"=="" (
  echo usage: sfx effect-name 1>&2
  exit /b 1
)

set "config=%XDG_CONFIG_HOME%"
if "%config%"=="" set "config=%USERPROFILE%\.config"
set "target=%config%\evanhahn-sfx\%~1.ogg"

start "" /B mpv --really-quiet --no-video "%target%"
