#!/usr/bin/env python3
"""Continuously displays the current time using watch.

Usage: clock
"""

from __future__ import annotations

import datetime as _dt
import time


def _format_time(now: _dt.datetime) -> str:
    formatted = now.strftime("%I:%M:%S%p")
    if formatted.startswith("0"):
        formatted = " " + formatted[1:]
    return formatted


def main() -> None:
    try:
        while True:
            print(_format_time(_dt.datetime.now()))
            time.sleep(1)
    except KeyboardInterrupt:
        pass


if __name__ == "__main__":
    main()
