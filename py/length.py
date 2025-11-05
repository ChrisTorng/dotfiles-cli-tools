#!/usr/bin/env python3
"""Count the number of characters in the provided arguments."""

import sys

def main() -> None:
    text = " ".join(sys.argv[1:]) if len(sys.argv) > 1 else ""
    print(len(text))


if __name__ == "__main__":
    main()
