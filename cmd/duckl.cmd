@echo off
:: Opens the lightweight DuckDuckGo interface with an optional search query.
:: Usage: duckl [search terms...]
setlocal enabledelayedexpansion
if "%~1"=="" goto open_home
set "query=%*"
set "query=!query:"=!"
set "query=!query: =+!"
if defined BROWSER (
  call "%BROWSER%" "https://lite.duckduckgo.com/lite?q=!query!"
) else (
  start "" "https://lite.duckduckgo.com/lite?q=!query!"
)
goto end
:open_home
if defined BROWSER (
  call "%BROWSER%" "https://lite.duckduckgo.com"
) else (
  start "" "https://lite.duckduckgo.com"
)
:end
endlocal
