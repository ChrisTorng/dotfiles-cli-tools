@echo off
REM Fetches the best available audio stream via yt-dlp.
REM Usage: getsong <url> [yt-dlp-args...]

yt-dlp -f bestaudio -o "%%(title)s.%%(ext)s" %*
