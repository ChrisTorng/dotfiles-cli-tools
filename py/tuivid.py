#!/usr/bin/env python3
"""Plays video in the terminal using mpv's tct video output.

Usage: tuivid <video-path>
"""

from __future__ import annotations

import subprocess
import sys

MPV_FLAGS = [
    "--quiet",
    "--vo=tct",
    "--vo-tct-256=yes",
    "--vo-tct-algo=plain",
    "--framedrop=vo",
]


def main(argv: list[str] | None = None) -> None:
    args = sys.argv[1:] if argv is None else argv
    subprocess.run(["mpv", *MPV_FLAGS, *args], check=False)


if __name__ == "__main__":
    main()
