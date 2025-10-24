#!/usr/bin/env python3
"""Converts stdin to uppercase characters.

Usage: uppered < input
"""

import sys

def main() -> None:
    data = sys.stdin.read()
    sys.stdout.write(data.upper())


if __name__ == "__main__":
    main()
