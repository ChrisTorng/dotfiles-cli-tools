#!/usr/bin/env python3
"""Displays the 0-255 ANSI color codes.

Usage: list-colors
"""

from __future__ import annotations


def main() -> None:
    for i in range(256):
        print(f"\x1b[38;5;{i}m{i} ", end="")
    print("\x1b[0m")


if __name__ == "__main__":
    main()
