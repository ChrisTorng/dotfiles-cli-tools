#!/usr/bin/env python3
"""Convert stdin to lowercase characters."""

import sys

def main() -> None:
    data = sys.stdin.read()
    sys.stdout.write(data.lower())


if __name__ == "__main__":
    main()
