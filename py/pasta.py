#!/usr/bin/env python3
"""Prints clipboard contents with platform-specific fallbacks.

Usage: pasta
"""

from __future__ import annotations

import os
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

COMMANDS = (
    ("pbpaste", ["pbpaste"]),
    ("xclip", ["xclip", "-selection", "clipboard", "-o"]),
    ("wl-paste", ["wl-paste"]),
    ("powershell", ["powershell", "-NoProfile", "-Command", "Get-Clipboard"]),
)

FALLBACK_FILE = Path(tempfile.gettempdir()) / "clipboard.txt"


def try_command(executable: str, command: list[str]) -> bool:
    if shutil.which(executable) is None:
        return False
    try:
        result = subprocess.run(command, check=False)
    except FileNotFoundError:
        return False
    return result.returncode == 0


def main() -> None:
    for executable, command in COMMANDS:
        if executable == "powershell" and os.name != "nt":
            continue
        if try_command(executable, command):
            return

    if FALLBACK_FILE.exists():
        sys.stdout.write(FALLBACK_FILE.read_text(encoding="utf-8"))
    else:
        print("")


if __name__ == "__main__":
    main()
