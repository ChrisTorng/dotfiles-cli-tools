#!/usr/bin/env python3
"""Opens a calculator REPL, preferring rink, then Python, then bc.

Usage: math
"""

from __future__ import annotations

import shutil
import subprocess
import sys

CANDIDATES = [
    ("rink", ["rink"]),
    ("python3", ["python3", "-i", "-c", "from math import *; from statistics import *"]),
    ("bc", ["bc"]),
]


def main() -> None:
    for executable, command in CANDIDATES:
        if shutil.which(executable):
            subprocess.run(command, check=False)
            return
    print("math: couldn't find any math program", file=sys.stderr)
    sys.exit(1)


if __name__ == "__main__":
    main()
