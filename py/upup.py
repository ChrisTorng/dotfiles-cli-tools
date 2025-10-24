#!/usr/bin/env python3
"""Updates Homebrew and Flatpak packages if the tools are available.

Usage: upup
"""

from __future__ import annotations

import shutil
import subprocess


def main() -> None:
    if shutil.which("brew"):
        subprocess.run(["brew", "update"], check=False)
        subprocess.run(["brew", "upgrade"], check=False)
        subprocess.run(["brew", "cleanup"], check=False)
    if shutil.which("flatpak"):
        subprocess.run(["flatpak", "update", "--assumeyes"], check=False)


if __name__ == "__main__":
    main()
