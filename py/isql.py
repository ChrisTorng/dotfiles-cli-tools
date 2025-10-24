#!/usr/bin/env python3
"""Opens an in-memory SQLite shell session.

Usage: isql
"""

from __future__ import annotations

import subprocess


def main() -> None:
    subprocess.run(["sqlite3", ":memory:"], check=False)


if __name__ == "__main__":
    main()
