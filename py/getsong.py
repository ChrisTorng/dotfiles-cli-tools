#!/usr/bin/env python3
"""Fetches the best available audio stream via yt-dlp.

Usage: getsong <url> [yt-dlp-args...]
"""

from __future__ import annotations

import subprocess
import sys


def main(argv: list[str] | None = None) -> None:
    args = sys.argv[1:] if argv is None else argv
    subprocess.run(["yt-dlp", "-f", "bestaudio", "-o", "%(title)s.%(ext)s", *args], check=False)


if __name__ == "__main__":
    main()
