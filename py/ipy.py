#!/usr/bin/env python3
"""Starts the Python interactive interpreter.

Usage: ipy
"""

from __future__ import annotations

import code


def main() -> None:
    banner = "Python interactive shell"
    code.interact(banner=banner, local={})


if __name__ == "__main__":
    main()
