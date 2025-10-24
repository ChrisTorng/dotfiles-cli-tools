@echo off
REM Starts a simple HTTP server in the current directory on the chosen port.
REM Usage: serveit [port]

set "port=8000"
if not "%~1"=="" set "port=%~1"

where php >nul 2>nul
if not errorlevel 1 (
  php -S "localhost:%port%"
  exit /b
)

where python3 >nul 2>nul
if not errorlevel 1 (
  python3 -m http.server %port%
  exit /b
)

where python >nul 2>nul
if not errorlevel 1 (
  python -m http.server %port%
  if not errorlevel 1 exit /b
  python -m SimpleHTTPServer %port%
  exit /b
)

where py >nul 2>nul
if not errorlevel 1 (
  py -3 -m http.server %port%
  exit /b
)

where ruby >nul 2>nul
if not errorlevel 1 (
  ruby -run -e httpd . -p %port%
  exit /b
)

echo unable to start HTTP server 1>&2
exit /b 1
