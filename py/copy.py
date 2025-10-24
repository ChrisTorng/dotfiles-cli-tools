#!/usr/bin/env python3
"""Copies stdin or a file's contents to the system clipboard with several platform fallbacks.

Usage: copy [file]
"""

from __future__ import annotations

import argparse
import os
import subprocess
import sys
import tempfile
from pathlib import Path
from typing import Iterable

COMMANDS: tuple[tuple[str, ...], ...] = (
    ("pbcopy",),
    ("xclip", "-selection", "clipboard"),
    ("wl-copy",),
    ("putclip",),
)

WINDOWS_COMMAND: tuple[str, ...] = (
    "powershell",
    "-NoLogo",
    "-NoProfile",
    "-Command",
    "Set-Clipboard -Value ([Console]::In.ReadToEnd())",
)


def read_bytes(path: Path | None) -> bytes:
    if path is None:
        return sys.stdin.buffer.read()
    return path.read_bytes()


def try_run(command: Iterable[str], data: bytes) -> bool:
    try:
        subprocess.run(tuple(command), input=data, check=True)
    except FileNotFoundError:
        return False
    except subprocess.CalledProcessError:
        return False
    else:
        return True


def try_windows_clipboard(data: bytes) -> bool:
    if os.name != "nt":
        return False
    try:
        text = data.decode(sys.getdefaultencoding(), errors="replace")
    except LookupError:
        text = data.decode("utf-8", errors="replace")
    return try_run(WINDOWS_COMMAND, text.encode("utf-8"))


def try_tkinter(data: bytes) -> bool:
    try:
        import tkinter  # type: ignore
    except ModuleNotFoundError:
        return False

    try:
        text = data.decode("utf-8")
    except UnicodeDecodeError:
        return False

    root = tkinter.Tk()
    root.withdraw()
    root.clipboard_clear()
    root.clipboard_append(text)
    root.update()
    root.destroy()
    return True


def fallback_file(data: bytes) -> Path:
    tmp = Path(tempfile.gettempdir()) / "clipboard.txt"
    tmp.write_bytes(data)
    return tmp


def copy_bytes(data: bytes) -> bool:
    if try_windows_clipboard(data):
        return True

    for command in COMMANDS:
        if try_run(command, data):
            return True

    if try_tkinter(data):
        return True

    return False


def main(argv: list[str] | None = None) -> None:
    parser = argparse.ArgumentParser(description="Copy text into the clipboard")
    parser.add_argument("file", nargs="?", type=Path)
    args = parser.parse_args(argv)

    data = read_bytes(args.file)

    if copy_bytes(data):
        return

    tmp_path = fallback_file(data)
    print(f"copy: clipboard command unavailable; wrote data to {tmp_path}", file=sys.stderr)


if __name__ == "__main__":
    main()
