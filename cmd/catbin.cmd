@echo off
REM Shows the contents of an executable found in your PATH using cat or bat.
REM Usage: catbin <command-name>

if not "%~2"=="" (
  echo usage: catbin command-name 1>&2
  exit /b 1
)

if "%~1"=="" (
  echo usage: catbin command-name 1>&2
  exit /b 1
)

for /f "delims=" %%P in ('where "%~1" 2^>nul') do (
  set "command_path=%%~fP"
  goto :found
)

echo could not find %~1 1>&2
exit /b 1

:found
setlocal
set "pager="
where bat >nul 2>nul
if errorlevel 1 (
  set "pager=type"
) else (
  set "pager=bat --paging=never"
)

if "%pager%"=="type" (
  endlocal
  type "%command_path%"
  exit /b
) else (
  for /f "tokens=1*" %%A in ("%pager%") do (
    endlocal
    %%A %%B "%command_path%"
    exit /b
  )
)
