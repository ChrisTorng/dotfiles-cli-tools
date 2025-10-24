#!/usr/bin/env python3
"""Runs a command in the background while silencing stdout/stderr if launched from a terminal.

Usage: bb <command> [args...]
"""

from __future__ import annotations

import subprocess
import sys
from typing import List


def main(argv: List[str] | None = None) -> None:
    args = list(sys.argv[1:] if argv is None else argv)
    if not args:
        print("usage: bb <command> [args...]", file=sys.stderr)
        sys.exit(1)

    stdout = subprocess.DEVNULL if sys.stdout.isatty() else None
    stderr = subprocess.DEVNULL if sys.stderr.isatty() else None

    try:
        subprocess.Popen(
            args,
            stdout=stdout,
            stderr=stderr,
            start_new_session=True,
        )
    except FileNotFoundError as exc:
        print(f"bb: command not found: {args[0]}", file=sys.stderr)
        sys.exit(127)


if __name__ == "__main__":
    main()
