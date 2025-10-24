#!/usr/bin/env python3
"""Converts stdin to lowercase characters.

Usage: lowered < input
"""

import sys

def main() -> None:
    data = sys.stdin.read()
    sys.stdout.write(data.lower())


if __name__ == "__main__":
    main()
