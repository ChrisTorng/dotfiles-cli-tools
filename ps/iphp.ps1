#!/usr/bin/env pwsh
# Launches the PHP interactive shell.
# Usage: iphp.ps1

Set-StrictMode -Version Latest

& php -a
exit $LASTEXITCODE
