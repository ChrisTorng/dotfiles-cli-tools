#!/usr/bin/env pwsh
# Starts the Python interactive interpreter.
# Usage: ipy.ps1

Set-StrictMode -Version Latest

& python3 -i
exit $LASTEXITCODE
