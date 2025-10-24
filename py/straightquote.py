#!/usr/bin/env python3
"""Converts curly quotes in the input to straight ASCII quotes.

Usage: straightquote < input
"""

from __future__ import annotations

import sys

REPLACEMENTS = {
    "“": '"',
    "”": '"',
    "‘": "'",
    "’": "'",
}


def main() -> None:
    text = sys.stdin.read()
    for source, target in REPLACEMENTS.items():
        text = text.replace(source, target)
    sys.stdout.write(text)


if __name__ == "__main__":
    main()
