#!/usr/bin/env python3
"""Prints the PATH environment variable one directory per line.

Usage: prettypath
"""

from __future__ import annotations

import os


def main() -> None:
    path = os.environ.get("PATH", "")
    for entry in path.split(os.pathsep):
        print(entry)


if __name__ == "__main__":
    main()
