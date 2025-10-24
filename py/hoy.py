#!/usr/bin/env python3
"""Prints today's date in YYYY-MM-DD format without a trailing newline.

Usage: hoy
"""

from datetime import date

def main() -> None:
    print(date.today().isoformat(), end="")


if __name__ == "__main__":
    main()
