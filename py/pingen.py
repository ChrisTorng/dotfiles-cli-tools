#!/usr/bin/env python3
"""Generate a random numeric PIN of the requested length."""

import argparse
import secrets
import string

def main() -> None:
    parser = argparse.ArgumentParser(description="Generate a random numeric PIN")
    parser.add_argument("length", type=int, nargs="?", default=6, help="Number of digits to generate")
    args = parser.parse_args()

    if args.length <= 0:
        parser.error("length must be positive")

    digits = ''.join(secrets.choice(string.digits) for _ in range(args.length))
    print(digits)


if __name__ == "__main__":
    main()
