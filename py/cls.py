#!/usr/bin/env python3
"""Clears the current terminal screen.

Usage: cls
"""

from __future__ import annotations

import os
import shutil
import subprocess
import sys


def main() -> None:
    command = "cls" if os.name == "nt" else "clear"
    executable = shutil.which(command)
    if executable is None:
        # Fallback to ANSI escape
        sys.stdout.write("\033[2J\033[H")
        sys.stdout.flush()
        return
    subprocess.run([executable], check=False)


if __name__ == "__main__":
    main()
