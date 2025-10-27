#!/usr/bin/env python3
"""Runs a command in the background while silencing stdout/stderr if launched from a terminal.

Usage: bb <command> [args...]
"""

from __future__ import annotations

import argparse
import subprocess
import sys
from typing import List


def _build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Run a command in the background",
        add_help=True,
    )
    parser.add_argument(
        "command",
        nargs=argparse.REMAINDER,
        help="Command to run",
        metavar="command ...",
    )
    return parser


def main(argv: List[str] | None = None) -> None:
    parser = _build_parser()
    args = parser.parse_args(sys.argv[1:] if argv is None else argv)

    if not args.command:
        parser.print_usage(sys.stderr)
        parser.exit(1, "bb: missing command\n")

    stdout = subprocess.DEVNULL if sys.stdout.isatty() else None
    stderr = subprocess.DEVNULL if sys.stderr.isatty() else None

    try:
        subprocess.Popen(
            args.command,
            stdout=stdout,
            stderr=stderr,
            start_new_session=True,
        )
    except FileNotFoundError:
        print(f"bb: command not found: {args.command[0]}", file=sys.stderr)
        sys.exit(127)


if __name__ == "__main__":
    main()
