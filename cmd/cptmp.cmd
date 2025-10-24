@echo off
REM Creates a temporary file path, prints it, and copies it to the clipboard.
REM Usage: cptmp

setlocal EnableDelayedExpansion
set "tempdir=%TEMP%"
if "%tempdir%"=="" set "tempdir=%USERPROFILE%\AppData\Local\Temp"

:again
set "candidate=cli-%RANDOM%%RANDOM%.tmp"
set "fullpath=%tempdir%\%candidate%"
if exist "!fullpath!" goto again

<nul set /p="!fullpath!"

echo|set /p="!fullpath!" | "%~dp0copy.cmd"
