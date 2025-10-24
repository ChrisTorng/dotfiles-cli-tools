@echo off
set "length=%~1"
if "%length%"=="" set "length=6"
for /f "delims=" %%a in ('powershell -NoProfile -Command "param($l); if($l -le 0){exit 1}; $digits = -join (1..$l | ForEach-Object { Get-Random -Minimum 0 -Maximum 10 }); Write-Output $digits" %length%') do set "pin=%%a"
if not defined pin exit /b 1
echo %pin%
