#!/usr/bin/env python3
"""Measures elapsed time by timing stdin until EOF.

Usage: stopwatch
"""

from __future__ import annotations

import datetime as _dt
import sys
import time


def format_time(prefix: str) -> str:
    now = _dt.datetime.now().strftime("%I:%M:%S%p")
    if now.startswith("0"):
        now = now[1:]
    return f"{now}: {prefix}"


def main() -> None:
    print(format_time("stopwatch started (^D to stop)"))
    start = time.perf_counter()
    try:
        while True:
            chunk = sys.stdin.buffer.read(1024)
            if not chunk:
                break
            sys.stdout.buffer.write(chunk)
            sys.stdout.buffer.flush()
    except KeyboardInterrupt:
        pass
    elapsed = time.perf_counter() - start
    print(format_time("stopwatch stopped"))
    print(f"Elapsed: {elapsed:.3f}s", file=sys.stderr)


if __name__ == "__main__":
    main()
