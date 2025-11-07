#!/usr/bin/env python3
"""Runs ls -a with color flags appropriate for the current platform.

Usage: la [ls-args...]
"""

from __future__ import annotations

import platform
import subprocess
import sys


def main(argv: list[str] | None = None) -> None:
    args = sys.argv[1:] if argv is None else argv
    flag = "-G" if platform.system() == "Darwin" else "--color"
    subprocess.run(["ls", "-a", flag, *args], check=False)


if __name__ == "__main__":
    main()
