#!/usr/bin/env python3
"""Prints unique file extensions from newline-delimited paths on stdin.

Usage: extensions < file-list
"""

import os
import sys

def main() -> None:
    extensions_seen: set[str] = set()

    for line in sys.stdin:
        _, ext = os.path.splitext(line.strip())
        if len(ext) > 1 and ext not in extensions_seen:
            print(ext)
            extensions_seen.add(ext)


if __name__ == "__main__":
    main()