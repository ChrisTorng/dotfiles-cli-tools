@echo off
REM Streams audio-only playback via mpv, deferring to yt-dlp for URLs.
REM Usage: tunes <urls...>

mpv --no-video --ytdl-format=worstaudio %*
