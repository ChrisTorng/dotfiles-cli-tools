#!/usr/bin/env python3
"""Grabs YouTube subtitles as plain text by calling yt-dlp and parsing VTT data.

Usage: getsubs <url>
"""

from __future__ import annotations

import argparse
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path


def download_vtt(url: str, auto: bool = False) -> str | None:
    if shutil.which("yt-dlp") is None:
        raise RuntimeError("yt-dlp is required to run getsubs")

    with tempfile.TemporaryDirectory() as tmp_dir:
        tmp_path = Path(tmp_dir)
        flags = [
            "--skip-download",
            "--sub-lang",
            "en",
            "--sub-format",
            "vtt",
            "-o",
            str(tmp_path / "%(id)s.%(ext)s"),
        ]
        flags.append("--write-auto-sub" if auto else "--write-sub")
        result = subprocess.run(["yt-dlp", *flags, url], check=False)
        if result.returncode != 0:
            return None

        for entry in tmp_path.glob("*.vtt"):
            return entry.read_text(encoding="utf-8", errors="ignore")
    return None


def parse_vtt(vtt_text: str) -> list[str]:
    lines: list[str] = []
    buffer: list[str] = []

    def flush() -> None:
        if not buffer:
            return
        text = " ".join(buffer).strip()
        buffer.clear()
        if not text:
            return
        if not lines or lines[-1] != text:
            lines.append(text)

    for raw_line in vtt_text.splitlines():
        line = raw_line.strip()
        if not line:
            flush()
            continue
        if line.startswith("WEBVTT") or line.startswith("NOTE") or line.startswith("STYLE"):
            continue
        if "-->" in line:
            flush()
            continue
        if line.isdigit():
            continue
        buffer.append(line)

    flush()
    return lines


def main(argv: list[str] | None = None) -> None:
    parser = argparse.ArgumentParser(description="Download subtitles for a video")
    parser.add_argument("url", help="Video URL")
    args = parser.parse_args(argv)

    vtt = download_vtt(args.url)
    if vtt is None:
        vtt = download_vtt(args.url, auto=True)
    if vtt is None:
        print("getsubs: failed to download subtitles", file=sys.stderr)
        sys.exit(1)

    for line in parse_vtt(vtt):
        print(line)


if __name__ == "__main__":
    main()
