#!/usr/bin/env python3
"""Shows the current time and today's calendar with the current date highlighted.

Usage: rn
"""

from __future__ import annotations

import calendar
import datetime as _dt

HIGHLIGHT_START = "\x1b[7m"
HIGHLIGHT_END = "\x1b[0m"


def format_time(now: _dt.datetime) -> str:
    formatted = now.strftime("%I:%M%p on %A, %B %d, %Y")
    if formatted.startswith("0"):
        formatted = formatted[1:]
    return formatted


def highlight_calendar(year: int, month: int, day: int) -> str:
    cal = calendar.TextCalendar().formatmonth(year, month)
    target = f"{day:2d}"
    highlight = f"{HIGHLIGHT_START}{target}{HIGHLIGHT_END}"
    lines = []
    replaced = False
    for line in cal.splitlines():
        if not replaced and target in line:
            line = line.replace(target, highlight, 1)
            replaced = True
        lines.append(line)
    return "\n".join(lines)


def main() -> None:
    now = _dt.datetime.now()
    print(format_time(now))
    print()
    print(highlight_calendar(now.year, now.month, now.day))


if __name__ == "__main__":
    main()
