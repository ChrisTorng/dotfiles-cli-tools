#!/usr/bin/env python3
"""Continuously prints clipboard changes until interrupted.

Usage: pastas [--interval SECONDS] [--once]
"""

from __future__ import annotations

import argparse
import subprocess
import sys
import time
from pathlib import Path

DEFAULT_POLL_INTERVAL = 0.1


def _build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Monitor clipboard changes")
    parser.add_argument(
        "--interval",
        type=float,
        default=DEFAULT_POLL_INTERVAL,
        help=f"Seconds between polls (default: {DEFAULT_POLL_INTERVAL})",
    )
    parser.add_argument(
        "--once",
        action="store_true",
        help="Print the next clipboard value and exit",
    )
    return parser


def read_clipboard() -> str:
    pasta_script = Path(__file__).with_name("pasta.py")
    result = subprocess.run(
        [sys.executable, str(pasta_script)],
        capture_output=True,
        text=True,
        check=False,
    )
    return result.stdout


def main(argv: list[str] | None = None) -> None:
    parser = _build_parser()
    args = parser.parse_args(argv)

    last_value: str | None = None
    try:
        while True:
            value = read_clipboard()
            if value != last_value:
                print(value, end="")
                last_value = value
                if args.once:
                    break
            time.sleep(max(args.interval, 0))
    except KeyboardInterrupt:
        pass


if __name__ == "__main__":
    main()
