@echo off
REM Downloads audio from online sources via yt-dlp with podcast-friendly settings.
REM Usage: getpod <url> [yt-dlp-args...]

yt-dlp --embed-chapters --embed-thumbnail --extract-audio --audio-format mp3 -f worstaudio %*
