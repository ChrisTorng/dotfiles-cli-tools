#!/usr/bin/env python3
"""Shortcut that forwards arguments to the snippets helper command.

Usage: snippet [args...]
"""

from __future__ import annotations

import subprocess
import sys


def main(argv: list[str] | None = None) -> None:
    args = sys.argv[1:] if argv is None else argv
    subprocess.run(["snippets", *args], check=False)


if __name__ == "__main__":
    main()
