@echo off
setlocal EnableDelayedExpansion
set "text=%*"
set "len=0"
:loop
if not "!text!"=="" (
    set "text=!text:~1!"
    set /a len+=1
    goto loop
)
echo !len!
