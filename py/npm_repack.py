#!/usr/bin/env python3
"""Repackages an npm tarball with optimal gzip compression for size comparison.

Usage: npm-repack <package-name-or-directory>
"""

from __future__ import annotations

import argparse
import gzip
import shutil
import subprocess
from pathlib import Path


def format_size(path: Path) -> str:
    return f"{path.stat().st_size}\t{path}"


def main(argv: list[str] | None = None) -> None:
    parser = argparse.ArgumentParser(description="Repack an npm tarball")
    parser.add_argument("package")
    args = parser.parse_args(argv)

    pack = subprocess.run(
        ["npm", "pack", args.package], capture_output=True, text=True, check=True
    )
    tarball = Path(pack.stdout.strip().splitlines()[-1])

    print(format_size(tarball))

    tar_path = tarball.with_suffix("").with_suffix(".tar")
    with gzip.open(tarball, "rb") as src, open(tar_path, "wb") as dst:
        shutil.copyfileobj(src, dst)
    tarball.unlink()

    subprocess.run(["zopfli", "--gzip", "-i1000", str(tar_path)], check=True)
    recompressed = Path(f"{tar_path}.gz")

    print(format_size(recompressed))


if __name__ == "__main__":
    main()
