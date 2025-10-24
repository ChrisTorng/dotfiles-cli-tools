@echo off
:: Runs git with the provided arguments, defaulting to git status.
:: Usage: g [git-args...]
if "%~1"=="" (
  git status
) else (
  git %*
)
