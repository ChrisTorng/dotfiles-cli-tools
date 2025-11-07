#!/usr/bin/env python3
"""Lists running processes, optionally filtering by a case-insensitive pattern.

Usage: running [pattern]
"""

from __future__ import annotations

import argparse
import os
import re
import subprocess

PID_HIGHLIGHT = "\x1b[35m"
RESET = "\x1b[0m"


def get_process_lines() -> list[str]:
    if os.name == "nt":
        result = subprocess.run(["tasklist"], capture_output=True, text=True, check=False)
    else:
        result = subprocess.run(["ps", "-eo", "pid,command"], capture_output=True, text=True, check=False)
    return result.stdout.splitlines()


def highlight_pid(line: str) -> str:
    match = re.match(r"(\s*\d+)(.*)", line)
    if not match:
        return line
    return f"{PID_HIGHLIGHT}{match.group(1)}{RESET}{match.group(2)}"


def main(argv: list[str] | None = None) -> None:
    parser = argparse.ArgumentParser(description="List running processes")
    parser.add_argument("pattern", nargs="?", help="Case-insensitive filter")
    args = parser.parse_args(argv)

    lines = get_process_lines()
    if args.pattern:
        needle = args.pattern.casefold()
        lines = [line for line in lines if needle in line.casefold()]

    for line in lines:
        print(highlight_pid(line))


if __name__ == "__main__":
    main()
