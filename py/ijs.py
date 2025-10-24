#!/usr/bin/env python3
"""Opens an interactive JavaScript REPL using Deno, Node, or osascript.

Usage: ijs
"""

from __future__ import annotations

import shutil
import subprocess
import sys

CANDIDATES = [
    ("deno", ["deno", "repl"]),
    ("node", ["node"]),
    ("osascript", ["osascript", "-il", "JavaScript"]),
]


def main() -> None:
    for executable, command in CANDIDATES:
        if shutil.which(executable):
            subprocess.run(command, check=False)
            return
    print("ijs: no js runtime found", file=sys.stderr)
    sys.exit(1)


if __name__ == "__main__":
    main()
