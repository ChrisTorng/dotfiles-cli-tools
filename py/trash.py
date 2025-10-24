#!/usr/bin/env python3
"""Moves files to the system trash using Finder, gio, or PowerShell depending on the platform.

Usage: trash <files...>
"""

from __future__ import annotations

import os
import platform
import subprocess
import sys
from pathlib import Path


def trash_macos(paths: list[Path]) -> None:
    for path in paths:
        subprocess.run(
            [
                "/usr/bin/osascript",
                "-e",
                f'tell application "Finder" to delete POSIX file "{path}"',
            ],
            check=False,
        )


def trash_linux(paths: list[Path]) -> None:
    subprocess.run(["gio", "trash", *map(str, paths)], check=False)


def trash_windows(paths: list[Path]) -> None:
    script = (
        "$shell = New-Object -ComObject Shell.Application;"
        "$recycle = $shell.Namespace(10);"
        "foreach ($item in $args) { $recycle.MoveHere((Get-Item $item).FullName) }"
    )
    subprocess.run([
        "powershell",
        "-NoProfile",
        "-Command",
        script,
        *map(str, paths),
    ], check=False)


def main(argv: list[str] | None = None) -> None:
    args = sys.argv[1:] if argv is None else argv
    if not args:
        print("usage: trash <files...>", file=sys.stderr)
        sys.exit(1)
    paths = [Path(arg).resolve() for arg in args]

    system = platform.system()
    if system == "Darwin":
        trash_macos(paths)
    elif system == "Windows":
        trash_windows(paths)
    else:
        trash_linux(paths)


if __name__ == "__main__":
    main()
