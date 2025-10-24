#!/usr/bin/env python3
"""Wraps input in Markdown blockquote syntax while preserving blank lines.

Usage: markdownquote < input
"""

import sys

def main() -> None:
    for line in sys.stdin:
        trimmed = line.strip()
        if trimmed == "":
            print(">")
        elif trimmed.startswith(">"):
            print(trimmed)
        else:
            print("> " + trimmed)


if __name__ == "__main__":
    main()