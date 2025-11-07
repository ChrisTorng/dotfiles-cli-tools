#!/usr/bin/env python3
"""Runs every theme script in ~/.config/evanhahn-theme-scripts.d with the given arguments.

Usage: theme [args...]
"""

from __future__ import annotations

import os
import subprocess
import sys
from pathlib import Path


def main(argv: list[str] | None = None) -> None:
    args = sys.argv[1:] if argv is None else argv
    config_home = Path(os.environ.get("XDG_CONFIG_HOME", Path.home() / ".config"))
    scripts_dir = config_home / "evanhahn-theme-scripts.d"
    if not scripts_dir.is_dir():
        return
    for script in sorted(scripts_dir.iterdir()):
        if not script.is_file():
            continue
        print(f"{script} {' '.join(args)}".strip())
        subprocess.run([str(script), *args], check=False)


if __name__ == "__main__":
    main()
