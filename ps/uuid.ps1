#!/usr/bin/env pwsh
# Generates a random UUID v4 and prints it.
# Usage: uuid

[Console]::Out.Write([guid]::NewGuid().ToString())
