#!/usr/bin/env python3
"""Repeatedly runs a command until it succeeds.

Usage: tryna <command> [args...]
"""

from __future__ import annotations

import subprocess
import sys
import time

POLL_INTERVAL = 0.5


def main(argv: list[str] | None = None) -> None:
    args = sys.argv[1:] if argv is None else argv
    if not args:
        print("usage: tryna <command> [args...]", file=sys.stderr)
        sys.exit(1)
    while True:
        result = subprocess.run(args, check=False)
        if result.returncode == 0:
            break
        time.sleep(POLL_INTERVAL)


if __name__ == "__main__":
    main()
