#!/usr/bin/env python3
"""Generates a random UUID v4 and prints it.

Usage: uuid
"""

import uuid

def main() -> None:
    print(str(uuid.uuid4()))


if __name__ == "__main__":
    main()
