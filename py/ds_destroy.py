#!/usr/bin/env python3
"""Recursively removes .DS_Store files in the current directory tree.

Usage: ds-destroy
"""

from __future__ import annotations

import os
from pathlib import Path


TARGET = ".DS_Store"


def main() -> None:
    root = Path(os.getcwd())
    for path in root.rglob(TARGET):
        try:
            path.unlink()
        except FileNotFoundError:
            continue


if __name__ == "__main__":
    main()
