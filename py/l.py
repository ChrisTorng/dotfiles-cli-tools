#!/usr/bin/env python3
"""Runs ls with the provided arguments.

Usage: l [ls-args...]
"""

from __future__ import annotations

import subprocess
import sys


def main(argv: list[str] | None = None) -> None:
    args = sys.argv[1:] if argv is None else argv
    subprocess.run(["ls", *args], check=False)


if __name__ == "__main__":
    main()
