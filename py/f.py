#!/usr/bin/env python3
"""Shortcut for grep that forwards all arguments.

Usage: f [grep-args...]
"""

from __future__ import annotations

import subprocess
import sys


def main(argv: list[str] | None = None) -> None:
    args = sys.argv[1:] if argv is None else argv
    subprocess.run(["grep", *args], check=False)


if __name__ == "__main__":
    main()
