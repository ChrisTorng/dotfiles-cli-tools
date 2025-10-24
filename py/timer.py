#!/usr/bin/env python3
"""Sleeps for the specified duration then plays a sound and sends a notification.

Usage: timer <seconds>
"""

from __future__ import annotations

import argparse
import subprocess
import sys
import time
from pathlib import Path


def main(argv: list[str] | None = None) -> None:
    parser = argparse.ArgumentParser(description="Simple timer")
    parser.add_argument("seconds", type=float)
    args = parser.parse_args(argv)

    time.sleep(args.seconds)

    base = Path(__file__).parent
    subprocess.run([sys.executable, str(base / "sfx.py"), "ringaling"], check=False)
    subprocess.run(
        [
            sys.executable,
            str(base / "notify.py"),
            "timer complete",
            str(args.seconds),
        ],
        check=False,
    )


if __name__ == "__main__":
    main()
