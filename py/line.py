#!/usr/bin/env python3
"""Prints the Nth line from stdin.

Usage: line <number> < input
"""

import argparse
import sys

def main() -> None:
    parser = argparse.ArgumentParser(description="Print the Nth line from stdin")
    parser.add_argument("number", type=int, help="Line number to print (1-indexed)")
    args = parser.parse_args()

    if args.number <= 0:
        parser.error("number must be positive")

    for idx, line in enumerate(sys.stdin, start=1):
        if idx == args.number:
            sys.stdout.write(line)
            break
    else:
        sys.exit(1)


if __name__ == "__main__":
    main()
