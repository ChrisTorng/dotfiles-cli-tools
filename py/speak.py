#!/usr/bin/env python3
"""Speaks Markdown input aloud using say or espeak-ng if available.

Usage: speak < markdown
"""

from __future__ import annotations

import shutil
import subprocess
import sys


def convert_markdown(text: str) -> str:
    if shutil.which("pandoc") is None:
        return text
    result = subprocess.run(
        ["pandoc", "-f", "commonmark", "-t", "plain", "--wrap=preserve"],
        input=text,
        text=True,
        capture_output=True,
        check=False,
    )
    if result.returncode != 0:
        return text
    return result.stdout


def main() -> None:
    text = sys.stdin.read()
    plain = convert_markdown(text)

    if shutil.which("say"):
        subprocess.run(["say"], input=plain, text=True, check=False)
        return
    if shutil.which("espeak-ng"):
        subprocess.run(["espeak-ng"], input=plain, text=True, check=False)
        return

    print("speak: couldn't find any TTS program", file=sys.stderr)
    sys.exit(1)


if __name__ == "__main__":
    main()
