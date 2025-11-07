#!/usr/bin/env pwsh
# Opens an in-memory SQLite shell session.
# Usage: isql.ps1

Set-StrictMode -Version Latest

& sqlite3 :memory:
exit $LASTEXITCODE
