#!/usr/bin/env python3
"""Launches the PHP interactive shell.

Usage: iphp
"""

from __future__ import annotations

import subprocess


def main() -> None:
    subprocess.run(["php", "-a"], check=False)


if __name__ == "__main__":
    main()
