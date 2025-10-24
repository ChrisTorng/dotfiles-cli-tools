@echo off
:: Flushes the local DNS cache on supported systems.
:: Usage: flushdns
echo Flushing DNS resolver cache...
ipconfig /flushdns
