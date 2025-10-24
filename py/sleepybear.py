#!/usr/bin/env python3
"""Puts the computer to sleep using macOS or Linux commands.

Usage: sleepybear
"""

from __future__ import annotations

import platform
import subprocess
import sys


def main() -> None:
    system = platform.system()
    if system == "Darwin":
        subprocess.run([
            "/usr/bin/osascript",
            "-e",
            'tell application "System Events" to sleep',
        ], check=False)
    elif system == "Linux":
        subprocess.run(["systemctl", "suspend"], check=False)
    else:
        print("sleepybear: unsupported platform", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
