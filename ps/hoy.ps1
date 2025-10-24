#!/usr/bin/env pwsh
# Prints today's date in YYYY-MM-DD format without a trailing newline.
# Usage: hoy

[Console]::Out.Write((Get-Date -Format 'yyyy-MM-dd'))
