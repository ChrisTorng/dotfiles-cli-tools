@echo off
REM Opens a temporary file in %%EDITOR%% for quick notes, deleting it afterward manually if desired.
REM Usage: scratch

setlocal EnableDelayedExpansion
set "tempdir=%TEMP%"
if "!tempdir!"=="" set "tempdir=%USERPROFILE%\AppData\Local\Temp"

:again
set "file=!tempdir!\scratch-!RANDOM!!RANDOM!.txt"
if exist "!file!" goto again

echo Editing !file!

if defined EDITOR (
  "%EDITOR%" "!file!"
) else (
  notepad "!file!"
)
