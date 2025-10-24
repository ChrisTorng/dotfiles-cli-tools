#!/usr/bin/env python3
"""Displays images in mpv, looping each frame indefinitely.

Usage: pix <image-files...>
"""

from __future__ import annotations

import subprocess
import sys

MPV_FLAGS = ["--image-display-duration=inf", "--loop-file=inf"]


def main(argv: list[str] | None = None) -> None:
    args = sys.argv[1:] if argv is None else argv
    subprocess.run(["mpv", *MPV_FLAGS, *args], check=False)


if __name__ == "__main__":
    main()
