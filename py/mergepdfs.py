#!/usr/bin/env python3
"""Merges multiple PDFs into a single file using Ghostscript.

Usage: mergepdfs <output.pdf> <input.pdf...>
"""

from __future__ import annotations

import argparse
import subprocess
from pathlib import Path


def main(argv: list[str] | None = None) -> None:
    parser = argparse.ArgumentParser(description="Merge PDFs with Ghostscript")
    parser.add_argument("output", type=Path)
    parser.add_argument("inputs", nargs="+", type=Path)
    args = parser.parse_args(argv)

    subprocess.run(
        [
            "gs",
            "-q",
            "-dNOPAUSE",
            "-dBATCH",
            "-sDEVICE=pdfwrite",
            f"-sOutputFile={args.output}",
            *map(str, args.inputs),
        ],
        check=False,
    )


if __name__ == "__main__":
    main()
