@echo off
REM Streams a preset internet radio station with mpv.
REM Usage: radio <lofi|trance|salsa|kfai>

if "%~1"=="" (
  echo usage: radio lofi^|trance^|salsa^|kfai 1>&2
  exit /b 1
)

setlocal EnableDelayedExpansion
set "choice=%~1"
set "url="

if /I "!choice!"=="lofi" set "url=https://live.hunter.fm/lofi_low"
if /I "!choice!"=="trance" set "url=http://ubuntu.hbr1.com:19800/trance.ogg"
if /I "!choice!"=="salsa" set "url=https://latinasalsa.ice.infomaniak.ch/latinasalsa.mp3"
if /I "!choice!"=="kfai" set "url=https://kfai.broadcasttool.stream/kfai-1"

if "!url!"=="" (
  echo don't know !choice! 1>&2
  exit /b 1
)

mpv --really-quiet "!url!"
