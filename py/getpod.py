#!/usr/bin/env python3
"""Downloads audio from online sources via yt-dlp with podcast-friendly settings.

Usage: getpod <url> [yt-dlp-args...]
"""

from __future__ import annotations

import subprocess
import sys

DEFAULT_FLAGS = [
    "--embed-chapters",
    "--embed-thumbnail",
    "--extract-audio",
    "--audio-format",
    "mp3",
    "-f",
    "worstaudio",
]


def main(argv: list[str] | None = None) -> None:
    args = sys.argv[1:] if argv is None else argv
    subprocess.run(["yt-dlp", *DEFAULT_FLAGS, *args], check=False)


if __name__ == "__main__":
    main()
