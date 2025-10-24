@echo off
:: Puts the computer to sleep using Windows commands.
:: Usage: sleepybear
rundll32.exe powrprof.dll,SetSuspendState 0,1,0
