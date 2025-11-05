#!/usr/bin/env python3
"""Generate a random UUID v4 and print it."""

import uuid

def main() -> None:
    print(str(uuid.uuid4()))


if __name__ == "__main__":
    main()
