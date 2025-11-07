#!/usr/bin/env pwsh
# Starts a Leiningen Clojure REPL in the current project.
# Usage: iclj.ps1

Set-StrictMode -Version Latest

& lein repl
exit $LASTEXITCODE
