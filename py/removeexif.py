#!/usr/bin/env python3
"""Strips EXIF metadata from JPEG images using jhead.

Usage: removeexif <files...>
"""

from __future__ import annotations

import subprocess
import sys


def main(argv: list[str] | None = None) -> None:
    args = sys.argv[1:] if argv is None else argv
    subprocess.run(["jhead", "-purejpg", *args], check=False)


if __name__ == "__main__":
    main()
