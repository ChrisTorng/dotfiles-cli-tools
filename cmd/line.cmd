@echo off
if "%~1"=="" (
  echo Usage: %~nx0 NUMBER 1>&2
  exit /b 1
)
powershell -NoProfile -Command ^
"param($n); if($n -le 0){exit 1}; $index = 0; while(($line = [Console]::In.ReadLine()) -ne $null){ $index++; if($index -eq $n){ Write-Output $line; exit 0 }} exit 1" %1
exit /b %errorlevel%
