#!/usr/bin/env python3
"""Pings duckduckgo.com once to check connectivity.

Usage: pingbing
"""

from __future__ import annotations

import os
import subprocess

TARGET = "duckduckgo.com"


def main() -> None:
    flag = "-n" if os.name == "nt" else "-c"
    subprocess.run(["ping", flag, "1", TARGET], check=False)


if __name__ == "__main__":
    main()
