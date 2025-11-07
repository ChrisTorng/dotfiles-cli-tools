#!/usr/bin/env python3
"""Puts the computer to sleep using macOS, Linux, or Windows commands.

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
    elif system == "Windows":
        subprocess.run(["rundll32.exe", "powrprof.dll,SetSuspendState", "0,1,0"], check=False)
    else:
        print("sleepybear: unsupported platform", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
