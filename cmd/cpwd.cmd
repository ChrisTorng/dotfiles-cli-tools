@echo off
REM Copies the current working directory path to the clipboard.
REM Usage: cpwd

setlocal EnableDelayedExpansion
for /f "delims=" %%I in ('cd') do set "cwd=%%I"

<nul set /p="!cwd!"

echo|set /p="!cwd!" | "%~dp0copy.cmd"
