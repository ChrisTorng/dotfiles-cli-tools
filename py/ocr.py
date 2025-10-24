#!/usr/bin/env python3
"""Performs OCR on an image using tesseract if available.

Usage: ocr <image-path>
"""

from __future__ import annotations

import argparse
import shutil
import subprocess
import sys
from pathlib import Path


def run_tesseract(image: Path) -> int:
    if shutil.which("tesseract") is None:
        print("ocr: tesseract is required", file=sys.stderr)
        return 1
    result = subprocess.run(["tesseract", str(image), "stdout"], check=False)
    return result.returncode


def main(argv: list[str] | None = None) -> None:
    parser = argparse.ArgumentParser(description="Perform OCR on an image")
    parser.add_argument("image", type=Path)
    args = parser.parse_args(argv)

    if run_tesseract(args.image) != 0:
        sys.exit(1)


if __name__ == "__main__":
    main()
