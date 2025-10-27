#!/usr/bin/env python3
"""Continuously displays the current time.

Usage: clock [--interval SECONDS] [--once]
"""

from __future__ import annotations

import argparse
import datetime as _dt
import time


def _build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Display the current time")
    parser.add_argument(
        "--interval",
        type=float,
        default=1.0,
        help="Seconds to wait between updates (default: 1)",
    )
    parser.add_argument(
        "--once",
        action="store_true",
        help="Print the time once and exit",
    )
    return parser


def _format_time(now: _dt.datetime) -> str:
    formatted = now.strftime("%I:%M:%S%p")
    if formatted.startswith("0"):
        formatted = " " + formatted[1:]
    return formatted


def main(argv: list[str] | None = None) -> None:
    parser = _build_parser()
    args = parser.parse_args(argv)

    try:
        while True:
            print(_format_time(_dt.datetime.now()))
            if args.once:
                break
            time.sleep(max(args.interval, 0))
    except KeyboardInterrupt:
        pass


if __name__ == "__main__":
    main()
