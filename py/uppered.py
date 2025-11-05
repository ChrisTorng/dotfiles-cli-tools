#!/usr/bin/env python3
"""Convert stdin to uppercase characters."""

import sys

def main() -> None:
    data = sys.stdin.read()
    sys.stdout.write(data.upper())


if __name__ == "__main__":
    main()
