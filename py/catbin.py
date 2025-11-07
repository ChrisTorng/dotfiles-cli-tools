#!/usr/bin/env python3
"""Shows the contents of an executable found in your PATH using cat or bat.

Usage: catbin <command-name>
"""

from __future__ import annotations

import shutil
import subprocess
import sys
from pathlib import Path


def find_executable(name: str) -> Path:
    path = shutil.which(name)
    if path is None:
        print(f"catbin: command not found: {name}", file=sys.stderr)
        sys.exit(1)
    return Path(path)


def main(argv: list[str] | None = None) -> None:
    args = sys.argv[1:] if argv is None else argv
    if len(args) != 1:
        print("usage: catbin <command-name>", file=sys.stderr)
        sys.exit(1)
    target = find_executable(args[0])

    viewer = shutil.which("bat")
    if viewer:
        subprocess.run([viewer, str(target)], check=False)
        return

    with target.open("rb") as fh:
        sys.stdout.buffer.write(fh.read())


if __name__ == "__main__":
    main()
