#!/usr/bin/env python3
"""Streams audio-only playback via mpv, deferring to yt-dlp for URLs.

Usage: tunes <urls...>
"""

from __future__ import annotations

import subprocess
import sys

MPV_FLAGS = ["--no-video", "--ytdl-format=worstaudio"]


def main(argv: list[str] | None = None) -> None:
    args = sys.argv[1:] if argv is None else argv
    subprocess.run(["mpv", *MPV_FLAGS, *args], check=False)


if __name__ == "__main__":
    main()
