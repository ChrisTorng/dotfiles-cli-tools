#!/usr/bin/env python3
"""Lists emoji codes, optionally filtered by a case-insensitive search term.

Usage: emoji [search-term]
"""

from __future__ import annotations

import argparse
from pathlib import Path
from typing import Iterable

DATA_FILE = Path(__file__).with_name("emoji_data.txt")


def load_entries() -> list[str]:
    return [line.strip() for line in DATA_FILE.read_text(encoding="utf-8").splitlines() if line.strip()]


def print_all(entries: Iterable[str]) -> None:
    for line in entries:
        emoji = line.split(" ", 1)[0]
        print(emoji)


def search(entries: Iterable[str], term: str) -> None:
    term_lower = term.casefold()
    for line in entries:
        if term_lower in line.casefold():
            emoji = line.split(" ", 1)[0]
            print(emoji)


def main(argv: list[str] | None = None) -> None:
    parser = argparse.ArgumentParser(description="List emoji codes with optional filtering")
    parser.add_argument("term", nargs="?")
    args = parser.parse_args(argv)

    entries = load_entries()

    if args.term is None:
        print_all(entries)
        return

    search(entries, args.term)


if __name__ == "__main__":
    main()
