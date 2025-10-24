@echo off
:: Opens DuckDuckGo in the browser, optionally searching for the provided terms.
:: Usage: duck [search terms...]
setlocal enabledelayedexpansion
if "%~1"=="" goto open_home
set "query=%*"
set "query=!query:"=!"
set "query=!query: =+!"
if defined BROWSER (
  call "%BROWSER%" "https://duckduckgo.com/?q=!query!"
) else (
  start "" "https://duckduckgo.com/?q=!query!"
)
goto end
:open_home
if defined BROWSER (
  call "%BROWSER%" "https://duckduckgo.com"
) else (
  start "" "https://duckduckgo.com"
)
:end
endlocal
