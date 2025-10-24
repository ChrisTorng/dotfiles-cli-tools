@echo off
for /f "delims=" %%a in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd"') do set "today=%%a"
<nul set /p=%today%
