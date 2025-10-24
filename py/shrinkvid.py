#!/usr/bin/env python3
"""Re-encodes a video to H.264 with a chosen CRF for smaller output.

Usage: shrinkvid <input> <output> [crf]
"""

from __future__ import annotations

import argparse
import subprocess
from pathlib import Path


def main(argv: list[str] | None = None) -> None:
    parser = argparse.ArgumentParser(description="Re-encode a video with H.264")
    parser.add_argument("input", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("crf", nargs="?", default="30")
    args = parser.parse_args(argv)

    subprocess.run(
        [
            "ffmpeg",
            "-i",
            str(args.input),
            "-c:v",
            "libx264",
            "-tag:v",
            "avc1",
            "-movflags",
            "faststart",
            "-crf",
            str(args.crf),
            "-preset",
            "superfast",
            str(args.output),
        ],
        check=False,
    )


if __name__ == "__main__":
    main()
