@echo off
for /f "delims=" %%a in ('powershell -NoProfile -Command "[guid]::NewGuid().ToString()"') do set "uuid=%%a"
echo %uuid%
