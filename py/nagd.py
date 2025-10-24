#!/usr/bin/env python3
"""Sends a desktop notification every few minutes as a reminder.

Usage: nagd
"""

from __future__ import annotations

import subprocess
import time

MINUTES = 20


def notify(message: str) -> None:
    subprocess.run(["notify", "nag", message], check=False)


def main() -> None:
    notify(f"you'll get a reminder every {MINUTES} minutes")
    try:
        while True:
            time.sleep(MINUTES * 60)
            notify(f"it's been {MINUTES} minutes")
    except KeyboardInterrupt:
        pass


if __name__ == "__main__":
    main()
