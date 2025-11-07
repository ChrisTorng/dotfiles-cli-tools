#!/usr/bin/env python3
"""Runs git with the provided arguments, defaulting to git status.

Usage: g [git-args...]
"""

from __future__ import annotations

import subprocess
import sys


def main(argv: list[str] | None = None) -> None:
    args = sys.argv[1:] if argv is None else argv
    if not args:
        subprocess.run(["git", "status"], check=False)
    else:
        subprocess.run(["git", *args], check=False)


if __name__ == "__main__":
    main()
